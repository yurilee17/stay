<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>test</title>
   
    
<link rel="stylesheet" href="../../resource/css/hotel.css">
</head>
<body>
 <main id="product">
 	
 	 	<aside>
                <ul class="choice">
                    <li>
                         <a href="#">카테고리</a>
                    </li>
                    <li>
                        <a href="#"> 패션·의류·뷰티 </a>
                    </li>
                    <li>
                        <a href="#">남성의류</a>
                   	</li>
                    <li>
                        <a href="#">여성의류</a>
                    </li>
                    <li>
                        <a href="#">잡화</a>
                    </li>
                    <li>
                        <a href="#">뷰티</a>
                    </li>
                  
                    <li>
                        <a href="#">가전·디지털</a>
                    </li>  
                    <li>
                        <a href="#">노트북/PC</a>
                    </li>
                    <li>
                        <a href="#">가전</a>
                    </li>
                    <li>
                        <a href="#">휴대폰</a>
                    </li>
                    <li>
                        <a href="#">기타</a>
                    </li>
                    
                   <li>
                        <a href="#">가전·디지털</a>
                    </li>  
                    <li>
                        <a href="#">노트북/PC</a>
                    </li>
                    <li>
                        <a href="#">가전</a>
                    </li>
                    <li>
                        <a href="#">휴대폰</a>
                    </li>
                    <li>
                        <a href="#">기타</a>
                    </li>
                    
                   <li>
                        <a href="#">가전·디지털</a>
                    </li>  
                    <li>
                        <a href="#">노트북/PC</a>
                    </li>
                    <li>
                        <a href="#">가전</a>
                    </li>
                    <li>
                        <a href="#">휴대폰</a>
                    </li>
                    <li>
                        <a href="#">기타</a>
                    </li>
                    
                </ul>
            </aside>
       
 	<div class="right">
 		 <ul class="sort">
                    <li>
                        <a href="#">낮은 가격 순</a>
                    </li>
                    <li>
                        <a href="#">높은 가격 순</a>
                    </li>
                     <li>
                        <a href="#">지도</a>
                    </li>
                </ul>
            <%   for(int i =0; i<5; i++){     %>
                <table>
                	<tr>
                        <td><a href="#" class="thumb">
                            <img src="	https://via.placeholder.com/120x120" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">상품명</h3>
                            <a href="#" class="desc">상품설명</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">27,000</ins></li>
                                <li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li>
                                <li><span class="free-delivery">무료배송</span></li>
                            </ul>
                        </td>
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> 판매자
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star1">상품평</h6>
                        </td>
                    </tr>
                </table>
             <%   } %>
             
             </div>
                  
              </main>
             </body>
            </html>
