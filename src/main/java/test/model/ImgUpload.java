package test.model;

import org.springframework.web.multipart.MultipartFile;

public class ImgUpload {

private MultipartFile[] img;
	
	public void setImg(MultipartFile[] img) {
		this.img= img;
	}
	
	public MultipartFile[] getImg() {
		return img;
	}

}
