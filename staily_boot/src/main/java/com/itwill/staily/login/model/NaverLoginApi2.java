package com.itwill.staily.login.model;
import com.github.scribejava.core.builder.api.DefaultApi20;
public class NaverLoginApi2 extends DefaultApi20{
protected NaverLoginApi2(){
}
private static class InstanceHolder{
private static final NaverLoginApi2 INSTANCE = new NaverLoginApi2();
}
public static NaverLoginApi2 instance(){
return InstanceHolder.INSTANCE;
}
@Override
public String getAccessTokenEndpoint() {
return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
}
@Override
protected String getAuthorizationBaseUrl() {
return "https://nid.naver.com/oauth2.0/authorize";
}
}

