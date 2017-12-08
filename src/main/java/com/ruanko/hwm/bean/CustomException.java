package com.ruanko.hwm.bean;

//系统自定义异常处理类,针对预期的异常，需要在程序中抛出此类的异常  
@SuppressWarnings("serial")
public class CustomException extends Exception{  
    
  //异常信息  
  private String message;  
    
  public CustomException(String message){  
      super(message);  
      this.message=message;  
  }  


  public String getMessage() {  
      return message;  
  }  


  public void setMessage(String message) {  
      this.message = message;  
  }  
}  
