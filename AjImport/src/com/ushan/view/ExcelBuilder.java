//package com.ushan.view;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.poi.hssf.usermodel.HSSFFont;
//import org.apache.poi.hssf.usermodel.HSSFRow;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.hssf.util.HSSFColor;
//import org.apache.poi.ss.usermodel.CellStyle;
//import org.apache.poi.ss.usermodel.Font;
//import org.springframework.web.servlet.view.document.AbstractExcelView;
//
//import com.ushan.bean.Product;
//
//public class ExcelBuilder extends AbstractExcelView{
//
//	@Override
//	protected void buildExcelDocument(Map<String, Object> model	,
//			HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
//			throws Exception {
//		// get data model which is passed by the Spring container
//		List<Product> productList = (List<Product>) model.get("products");
//		
//		// create a new Excel sheet
//		HSSFSheet sheet = workbook.createSheet("Product details");
//		sheet.setDefaultColumnWidth(30);
//		
//		// create style for header cells
//		CellStyle style = workbook.createCellStyle();
//		Font font = workbook.createFont();
//        font.setFontName("Arial");
//        style.setFillForegroundColor(HSSFColor.BLUE.index);
//        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
//        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
//        font.setColor(HSSFColor.WHITE.index);
//        style.setFont(font);
//        
//     // create header row
//        HSSFRow header = sheet.createRow(0);
//         
//        header.createCell(0).setCellValue("Description");
//        header.getCell(0).setCellStyle(style);
//         
//        header.createCell(1).setCellValue("Quantity");
//        header.getCell(1).setCellStyle(style);
//         
//        header.createCell(2).setCellValue("Price");
//        header.getCell(2).setCellStyle(style);
//         
//        // create data rows
//        int rowCount = 1;
//        
//        for (Product product : productList) {
//        	HSSFRow aRow = sheet.createRow(rowCount++);
//            aRow.createCell(0).setCellValue(product.getProductName());
//            aRow.createCell(1).setCellValue(product.getProductQuantity());
//            aRow.createCell(2).setCellValue(product.getProductPrice());
//        }
//         
//		
//	}
//
//}
