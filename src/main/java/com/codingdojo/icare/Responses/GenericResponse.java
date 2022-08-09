package com.codingdojo.icare.Responses;

import java.util.List;

import org.springframework.validation.FieldError;

import com.codingdojo.icare.models.User;

public class GenericResponse {
	
	public Object data;
	
	List<FieldError> fieldErrors;
	
	Boolean success;
	
	public GenericResponse() {
		
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public List<FieldError> getFieldErrors() {
		return fieldErrors;
	}

	public void setFieldErrors(List<FieldError> fieldErrors) {
		this.fieldErrors = fieldErrors;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}
	
	

}
