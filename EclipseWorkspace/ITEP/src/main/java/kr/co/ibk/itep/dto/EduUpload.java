package kr.co.ibk.itep.dto;

import org.springframework.web.multipart.MultipartFile;

public class EduUpload {
	
	private MultipartFile excelFile;
	private String originalFileName;
	private String fileType;
	private String savedFileName;
	

	public MultipartFile getExcelFile() {
		return excelFile;
	}



	public void setExcelFile(MultipartFile excelFile) {
		this.excelFile = excelFile;
	}



	public String getOriginalFileName() {
		return originalFileName;
	}



	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}



	public String getFileType() {
		return fileType;
	}



	public void setFileType(String fileType) {
		this.fileType = fileType;
	}



	public String getSavedFileName() {
		return savedFileName;
	}



	public void setSavedFileName(String savedFileName) {
		this.savedFileName = savedFileName;
	}



	
}
