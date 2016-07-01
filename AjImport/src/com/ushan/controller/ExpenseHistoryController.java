package com.ushan.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ushan.bean.Product;
import com.ushan.dao.impl.ProductDAO;
import com.ushan.utill.ExcelUtil;

@Controller
@RequestMapping("/expenseHistory")
public class ExpenseHistoryController {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping(method=RequestMethod.GET)
	public String redirect()
	{
		return "expenseHistory";
	}

	@RequestMapping(value = "/generateReport1", method = RequestMethod.POST)
	public @ResponseBody String genarateReport(@RequestParam("fromDate") Date fromDate,@RequestParam("toDate") Date toDate,HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("From Date : "+fromDate.toString());
		/*Connection conn = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Please include Classpath Where your MySQL Driver is located");
			e.printStackTrace(); 
		}  
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","ushan");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

		Connection connection = null;
		try {
			connection = dataSource.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String reportName = "MONTLY_REPORT_WITH_DATE_RANGE";
		Calendar dateForAppend = Calendar.getInstance();
		String appendDate ="- "+"( "+dateForAppend.get(Calendar.DATE)+" - "+(dateForAppend.get(Calendar.MONTH)+1)+" - "+dateForAppend.get(Calendar.YEAR)+" )"; 
		try{
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("FROM_DATE", fromDate);
			map.put("TO_DATE", toDate);

			//			Jasper Report Type 1....

			//			JasperDesign jasperDesign = JRXmlLoader.load("src\\com\\ushan\\reports\\Date_Range_Report.jrxml");  
			//	        JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);  
			//	        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, connection);  
			//	        JasperExportManager.exportReportToPdfFile(jasperPrint, "D://PROGRAMS//Reports//"+reportName+appendDate+".pdf");
			//	        JasperExportManager.exportReportToHtmlFile(jasperPrint, "D://Murugesu//Documents//"+reportName+".html");

			//			Jasper Report Type 2....

			System.out.println("path " + request.getSession().getServletContext().getRealPath("/jasper/Date_Range_Report.jasper"));
			File reportFile = new File( request.getSession().getServletContext().getRealPath("/jasper/Date_Range_Report.jasper"));
			// If compiled file is not found, then compile XML template
			if (!reportFile.exists()) {
				JasperCompileManager.compileReportToFile(request.getSession().getServletContext().getRealPath("/jasper/Date_Range_Report.jrxml"),request.getSession().getServletContext().getRealPath("/jasper/Date_Range_Report.jasper"));
			}
			JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(reportFile.getPath());


			//	        For pdf to display in browser.....
			byte[] bytes = null;
			bytes = JasperRunManager.runReportToPdf(jasperReport,map,connection);
			response.reset();
			response.resetBuffer();
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment; filename=Expense_History.pdf");
			response.setContentLength(bytes.length);
			ServletOutputStream ouputStream = response.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);
			ouputStream.flush();
			ouputStream.close();
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

		return "expenseHistory";
	}

	@RequestMapping(value = "/generateReport", method = RequestMethod.GET)
	public void generateReport(HttpServletRequest request, HttpServletResponse response) {
		try {
			FileInputStream input = new FileInputStream("D:\\PROGRAMS\\AjImports Application\\AJ Import Web Application\\WebContent\\reports\\P_D.xlsx");
			Workbook workbook = WorkbookFactory.create(input);
			Sheet sheet = workbook.getSheetAt(0);
			Row row = sheet.getRow(2);
			Calendar calendar = Calendar.getInstance();
			Date date = calendar.getTime();
			Cell cell = row.getCell(1);

			List<Product> products = productDAO.getAllProducts();
			/*List<List<Object>> products = new ArrayList<List<Object>>();
			List<Object> product = new ArrayList<Object>();
			product.add("Cotton Shirts");
			product.add("3");
			product.add("1500");

			List<Object> product1 = new ArrayList<Object>();
			product1.add("T Shirts");
			product1.add("5");
			product1.add("2000");

			products.add(product);
			products.add(product1);*/

			int startRow = 5;
			int sNo = 1;
			for (Product eachProduct : products) {
				sheet.shiftRows(startRow, startRow+1, 1);
				Row row1 = sheet.createRow(startRow);
				ExcelUtil.copyStyleFromNextRow(sheet, row1, startRow+1);
				ExcelUtil.fillRow(sheet, startRow, 1, sNo++);
				ExcelUtil.fillRow(sheet, startRow, 2, eachProduct.getProductName());
				ExcelUtil.fillRow(sheet, startRow, 3, eachProduct.getProductQuantity());
				ExcelUtil.fillRow(sheet, startRow, 4, eachProduct.getProductPrice());
				startRow = startRow+1;
			}

			System.out.println("********************* "+ExcelUtil.getCellValue(sheet, 2, 1));
			cell.setCellValue(ExcelUtil.getCellValue(sheet, 2, 1).toString()+" "+date);
			/*FileOutputStream output = new FileOutputStream("PRODUCT_DETAILS.xlsx");
			response.setContentType("application/vnd.ms-excel");
			workbook.write(output);
			output.close();*/
			response.setHeader("Content-Disposition", "attachment; filename=PRODUCT_DETAILS.xlsx");
			//response.setContentType("application/vnd.ms-excel");
		    workbook.write(response.getOutputStream());
		    response.getOutputStream().close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	@RequestMapping(value="/getAllExpenseDetails",method=RequestMethod.GET)
	public @ResponseBody List<Product> getAllProducts(){
		List<Product> list = null;
		try {
			list = productDAO.getAllProducts();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

}

