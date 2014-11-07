package com.hhwork.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface Column {

	
	public String value() default "";
	
	public boolean ignore() default false;
	
	
}
