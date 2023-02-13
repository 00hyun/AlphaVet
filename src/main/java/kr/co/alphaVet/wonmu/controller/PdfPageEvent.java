package kr.co.alphaVet.wonmu.controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfPageEvent extends PdfPageEventHelper{
	Phrase[] header = new Phrase[2];
	int pagenumber;
	
	public void onStartPage(PdfWriter writer, Document document) {
        pagenumber++;
    }
	
	 public void onEndPage(PdfWriter writer, Document document) {
	        Rectangle rect = writer.getBoxSize("boxName"); // boxName을 PdfWriter.setBoxSize의 boxname 매개 변수와 같게 해야 함.
	         
	        switch (writer.getPageNumber() % 2) { // 쪽수 쪽, 홀수 쪽 구분해서 속성 적용.
	        case 0: // 짝수 쪽
	            ColumnText.showTextAligned(writer.getDirectContent(),
	                    Element.ALIGN_RIGHT, header[0], rect.getRight(),
	                    rect.getTop(), 0);
	            break;
	        case 1: // 홀수 쪽
	            ColumnText.showTextAligned(writer.getDirectContent(),
	                    Element.ALIGN_LEFT, header[1], rect.getLeft(),
	                    rect.getTop(), 0);
	            break;
	        }

        ColumnText.showTextAligned(writer.getDirectContent(),
        	Element.ALIGN_CENTER,
        	new Phrase(String.format("-%d-", pagenumber)), // %d의 앞 뒤에 "-" 추가하면 "-1-" 이런 식..
        	(rect.getLeft() + rect.getRight()) / 2, rect.getBottom() - 18, 0);
	 }
	 

}	 
