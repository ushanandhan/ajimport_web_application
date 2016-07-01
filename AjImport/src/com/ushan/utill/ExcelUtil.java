package com.ushan.utill;

import java.util.HashMap;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 * 
 * @author USHANANDHAN
 *
 */
public class ExcelUtil {

	public static void fillRow(Sheet sheet,int rowNum,int cellIndex,Object value){
		Row row = sheet.getRow(rowNum);
		if(row == null){
			row = sheet.createRow(rowNum);
		}
		Cell cell = row.getCell(cellIndex);
		if(cell == null){
			cell = row.createCell(cellIndex);
		}
		if(value instanceof Integer){
			cell.setCellValue((Integer)value);
		}else if(value instanceof Double){
			cell.setCellValue((Double)value);
		}else{
			cell.setCellValue((String)value);
		}
	}

	public static void copyStyleFromPreviousRow(Sheet sheet,Row row, int preRowNum){
		Map<Integer, CellStyle> styleMap = new HashMap<Integer, CellStyle>();
		copyRow(sheet,sheet,sheet.getRow(preRowNum),row,styleMap);
	}

	public static void copyStyleFromNextRow(Sheet sheet,Row row, int nextRowNum){
		Map<Integer, CellStyle> styleMap = new HashMap<Integer, CellStyle>();
		copyRow(sheet,sheet,sheet.getRow(nextRowNum),row,styleMap);
	}

	private static void copyRow(Sheet srcSheet, Sheet desSheet, Row srcRow, Row destRow,
			Map<Integer, CellStyle> styleMap) {
		destRow.setHeight(srcRow.getHeight());
		for (int cellCount = srcRow.getFirstCellNum(); cellCount <= srcRow.getLastCellNum() && cellCount>=0; cellCount++) {
			Cell oldCell = srcRow.getCell(cellCount);
			Cell newCell = destRow.getCell(cellCount);
			if (oldCell != null) {
				if(newCell == null){
					newCell = destRow.createCell(cellCount);
				}
				copyCell(oldCell,newCell,styleMap);
			}
		}
	}

	private static void copyCell(Cell oldCell, Cell newCell,
			Map<Integer, CellStyle> styleMap) {
		CellStyle oldCellStyle = oldCell.getCellStyle();
		if(styleMap != null){
			if(oldCell.getSheet().getWorkbook() == newCell.getSheet().getWorkbook()){
				newCell.setCellStyle(oldCellStyle);
			}else{
				int stHashCode = oldCellStyle.hashCode();
				CellStyle newCellStyle = styleMap.get(stHashCode);
				if(newCellStyle == null){
					newCellStyle = newCell.getSheet().getWorkbook().createCellStyle();
					newCellStyle.cloneStyleFrom(oldCellStyle);
					styleMap.put(stHashCode, newCellStyle);
				}
				newCell.setCellStyle(newCellStyle);
			}
		}
	}

	public static void mergeRegion(Sheet sheet,int firstRow, int lastRow, int firstCol,int lastCol){
		sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstCol, lastCol));
	}

	public static Row createRowIfNotExists(Sheet sheet,int rowNum){
		Row row = sheet.getRow(rowNum);
		if(row == null){
			row = sheet.createRow(rowNum);
		}
		return row;
	}

	public static void createCells(Sheet sheet,int startRow,int startCell,int endCell){
		Row row = sheet.getRow(startRow);
		if(row == null){
			row = sheet.createRow(startRow);
		}
		for (int i = 0; i <= endCell; ++i) {
			Cell cell = row.getCell(i);
			if (cell == null) {
				row.createCell(i);
			}
		}
	}
	
	public static Object getCellValue(Sheet sheet,int rowIndex,int columnIndex){
		Row row = sheet.getRow(rowIndex);
		Object cellValue = null;
		if(row != null){
			Cell cell = row.getCell(columnIndex);
			if(cell != null){
				switch (cell.getCellType()) {
				case Cell.CELL_TYPE_STRING:
					cellValue = cell.getRichStringCellValue().getString();
				break;
				case Cell.CELL_TYPE_NUMERIC:
					if(DateUtil.isCellDateFormatted(cell)){
						cellValue = cell.getRichStringCellValue().getString();
					}else{
						cellValue = Integer.valueOf((int) cell.getNumericCellValue());
					}
					
				break;
				case Cell.CELL_TYPE_BOOLEAN:
					cellValue = Boolean.valueOf(cell.getBooleanCellValue());
				break;
				case Cell.CELL_TYPE_FORMULA:
					cellValue = cell.getCellFormula();
				break;

				default:
				break;
				}
			}
		}
		return cellValue;
	}
}
