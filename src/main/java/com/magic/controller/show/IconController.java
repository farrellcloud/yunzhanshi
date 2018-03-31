package com.magic.controller.show;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.WriterException;
import com.magic.util.ImageUtil;
import com.magic.util.QRCodeUtil;

import de.schlichtherle.truezip.file.TFile;
import de.schlichtherle.truezip.file.TFileInputStream;

@Controller
@RequestMapping("/image")
public class IconController {
	
	
	@RequestMapping("/QRCode/{productName}")
	public void QRCode(@PathVariable String productName, HttpServletResponse response,HttpServletRequest request){
		response.setContentType("image/jpeg");
		OutputStream output = null;
		try {
			output = response.getOutputStream();
			String codeContent = request.getRequestURL().substring(0,request.getRequestURL().lastIndexOf("image")) + "show/" + productName;
			QRCodeUtil.getQRCode(codeContent, 350, 350,output);
			output.flush();
		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(output != null)
					output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
		}
	}
	
	@RequestMapping("/jpeg/{fileName}/{folder}/{x}/{y}")
	public void jpeg(@PathVariable String fileName,@PathVariable String folder,@PathVariable String x,@PathVariable String y, HttpServletResponse response){
		response.setContentType("image/jpg");
		OutputStream output = null;
		TFileInputStream input = null;
		try {
			String path = null;
			path = ImageUtil.getImagePath(fileName, folder, x, y);
			input = new TFileInputStream(new TFile(path));
			output = response.getOutputStream();
			IOUtils.copy(input, output);
			output.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(output != null)
					output.close();
				if(input != null)
					input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
		}
	}
}
