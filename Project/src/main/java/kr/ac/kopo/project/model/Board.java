package kr.ac.kopo.project.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class Board {
	private int boardNumber;
	private String title;
	private String url;
	private String context;
	private String boardDate;
	private String id;
	private String thumbnail;
	
	@Override
	public String toString() {
		return "Board [boardNumber=" + boardNumber + ", title=" + title + ", url=" + url + ", context=" + context
				+ ", boardDate=" + boardDate + ", id=" + id + ", thumbnail=" + thumbnail + ", image=" + image
				+ ", uploadFile=" + uploadFile + "]";
	}
	
	private String image;
	private MultipartFile uploadFile;
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
	
	
	
}
