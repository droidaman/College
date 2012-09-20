package source;

import java.io.*;

public class FileSystem {


	public static void main(String[] args) {
		FileSystem fs = new FileSystem();
		File fo = new File("/home/licastb/filelabtest/");
		
		fs.isFile(fo);
	}
	
	public void isFile(File f){
		if(f.isFile()){
			
		} else if (f.isDirectory()){
			File[] fl = f.listFiles();
		}
	}

}