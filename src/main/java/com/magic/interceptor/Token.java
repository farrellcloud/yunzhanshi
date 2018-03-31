package com.magic.interceptor;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention (RetentionPolicy.RUNTIME)
public @interface Token {
 
     boolean save() default false ;
 
     boolean remove() default false ;
}
