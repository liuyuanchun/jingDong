/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.76
 * Generated at: 2018-05-05 14:37:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entity.User;
import entity.Product;
import entity.Order;
import java.util.*;

public final class showOrder_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("    <title>订单页</title>\r\n");
      out.write("\t<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<script src=\"bootstrap/js/jquery.min.js\"  type=\"text/javascript\"></script>\r\n");
      out.write("\t<script src=\"bootstrap/js/bootstrap.min.js\"  type=\"text/javascript\"></script>\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t*{\r\n");
      out.write("\t\tmargin:0;\r\n");
      out.write("\t\tpadding:0;\r\n");
      out.write("\t}\r\n");
      out.write("\t#header{\r\n");
      out.write("\t\tmargin:10px auto;\r\n");
      out.write("\t\theight:82px;\r\n");
      out.write("\t\tborder: 1px red solid;\r\n");
      out.write("\t\tbackground-color:#e45050;\r\n");
      out.write("\t}\r\n");
      out.write("\t.header1 {\r\n");
      out.write("\t\tlist-style:none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.header1 li{\r\n");
      out.write("\t\tfloat:left;\r\n");
      out.write("\t}\r\n");
      out.write("\t#wodejingdong{\r\n");
      out.write("\t\tlist-style:none;\r\n");
      out.write("\t\tclear:both;\r\n");
      out.write("\t}\r\n");
      out.write("\t#content{\r\n");
      out.write("\t\twidth:1200px;\r\n");
      out.write("\t\tmargin:1px auto;\r\n");
      out.write("\t}\r\n");
      out.write("\t#myOrder{\r\n");
      out.write("\t\tmargin-left:30px;\r\n");
      out.write("\t\twidth:200px;\r\n");
      out.write("\t\tfont-size:16px;\r\n");
      out.write("\t\ttext-align:center;\r\n");
      out.write("\t\tfloat:left;\r\n");
      out.write("\t}\r\n");
      out.write("\t#myOrder .aboutOrder{\r\n");
      out.write("\t\tlist-style:none;\r\n");
      out.write("\t\tclear:both\r\n");
      out.write("\t}\r\n");
      out.write("\t.aboutOrder li{\r\n");
      out.write("\t\tmargin-top:10px;\r\n");
      out.write("\t}\r\n");
      out.write("\t#orderDescri{\r\n");
      out.write("\t\tfloat:left;\r\n");
      out.write("\t\twidth:900px;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tmargin-left:10px;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.productHeader{\r\n");
      out.write("\t\twidth:889px;\r\n");
      out.write("\t\theight:30px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.productContent{\r\n");
      out.write("\t\twidth:889px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.productHeader1{\r\n");
      out.write("\t\tlist-style:none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.productHeader1 li{\r\n");
      out.write("\t\tfloat:left;\r\n");
      out.write("\t}\r\n");
      out.write("\t.img{\r\n");
      out.write("\t\twidth:50px;\r\n");
      out.write("\t\theight:50px;\r\n");
      out.write("\t}\r\n");
      out.write("\t#menue{\r\n");
      out.write("\t\tlist-style:none;\r\n");
      out.write("\t}\r\n");
      out.write("\t#menue li{\r\n");
      out.write("\t\tfloat:left;\r\n");
      out.write("\t}\r\n");
      out.write("\ttable tr td:nth-child(1){\r\n");
      out.write("\t\twidth:50px;\r\n");
      out.write("\t}\r\n");
      out.write("\ttable tr td:nth-child(2){\r\n");
      out.write("\t\twidth:170px;\r\n");
      out.write("\t}\r\n");
      out.write("\t</style>\r\n");
      out.write("  </head>\r\n");
      out.write(" \r\n");
      out.write("  <body>\r\n");
      out.write("  \t   ");
List<Order> orders = (List<Order>)request.getAttribute("orderlist"); 
      out.write("\r\n");
      out.write("      <div id=\"header\">\r\n");
      out.write("      \t<ul class=\"header1\">\r\n");
      out.write("\t      \t<li style=\"margin-left:100px;\"><img src=\"images/logoOrder.png\"/></li>\r\n");
      out.write("\t      \t<li style=\"margin-top:20px;margin-left:10px;width:100px;height:50px;\">\r\n");
      out.write("\t      \t\t<ul id=\"wodejingdong\">\r\n");
      out.write("\t      \t\t\t<li><a style=\"color:#fff;font-size:20px;text-decoration:none;\">我的京东</a></li>\r\n");
      out.write("\t      \t\t\t<li><a style=\"text-decoration:none;\" href=\"showMain\">返回京东首页</a></li>\r\n");
      out.write("\t      \t\t</ul>\r\n");
      out.write("\t      \t</li>\r\n");
      out.write("\t      \t<li style=\"margin-top:30px;;margin-left:500px;width:100px;height:30px;background-color: #fff;\">\r\n");
      out.write("\t      \t<a  href=\"showCart\" style=\"font-size:20px;\">购物车&nbsp;&nbsp;></a></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("\t  <div id=\"content\">\r\n");
      out.write("\t  \t<div id=\"myOrder\">\r\n");
      out.write("\t\t  \t<ul class=\"aboutOrder\">\r\n");
      out.write("\t\t\t  \t<li>订单中心</li>\r\n");
      out.write("\t\t\t  \t<li><a href=\"showOrder\">我的订单</a></li>\r\n");
      out.write("\t\t\t  \t<li>我的活动</li>\r\n");
      out.write("\t\t\t  \t<li>评价晒单</li>\r\n");
      out.write("\t\t  \t</ul>\r\n");
      out.write("\t  \t</div>\r\n");
      out.write("\t  \t<div id=\"orderDescri\">\r\n");
      out.write("\t  \t<table class=\"table-bordered\">\r\n");
      out.write("\t  \t<tr>\r\n");
      out.write("\t\t  \t<td style=\"width:900px\">\r\n");
      out.write("\t\t  \t\t<ul id=\"menue\">\r\n");
      out.write("\t\t  \t\t\t<li>近三个月订单</li>\r\n");
      out.write("\t\t  \t\t\t<li style=\"margin-left:70px;\">订单详情</li>\r\n");
      out.write("\t\t  \t\t\t<li style=\"margin-left:100px;\">收货人</li>\r\n");
      out.write("\t\t  \t\t\t<li style=\"margin-left:100px;\">金额</li>\r\n");
      out.write("\t\t  \t\t\t<li style=\"margin-left:70px;\">全部状态</li>\r\n");
      out.write("\t\t  \t\t\t<li style=\"margin-left:90px;\">操作</li>\r\n");
      out.write("\t\t  \t\t</ul>\r\n");
      out.write("\t\t  \t\t\r\n");
      out.write("\t\t  \t</td>\r\n");
      out.write("\t  \t</tr>\r\n");
      out.write("\t \r\n");
      out.write("\t   \t");
 for(int i =0;i<orders.size();i++){ 
      out.write("\r\n");
      out.write("\t  \t\t\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t  \t\t\t<td><div class=\"productHeader\">\r\n");
      out.write("\t  \t\t\t\t<ul  class=\"productHeader1\" style=\"list-style:none;\">\r\n");
      out.write("\t  \t\t\t\t\t<li style=\"margin-left:10px;width:150px;\">");
      out.print(orders.get(i).getDate() );
      out.write("</li>\r\n");
      out.write("\t  \t\t\t\t\t<li style=\"margin-left:10px;width:200px;\">");
      out.print(orders.get(i).getNo() );
      out.write("</li>\r\n");
      out.write("\t  \t\t\t\t\t<li style=\"margin-left:100px;\">京东</li>\r\n");
      out.write("\t  \t\t\t\t\t<li style=\"margin-left:300px;\"><a href = \"deleteOrder?id=");
      out.print(orders.get(i).getId() );
      out.write("\">删除</a></li>\r\n");
      out.write("\t  \t\t\t\t</ul>\r\n");
      out.write("\t  \t\t\t</div></td>\r\n");
      out.write("\t  \t\t\t</tr>\r\n");
      out.write("\t  \t\t\t<tr><td><div class=\"productContent\">\r\n");
      out.write("\t  \t\t\t\t<table class=\"table\">\r\n");
      out.write("\t  \t\t\t\t");
List<Product> pro = orders.get(i).getProducts();
	  				for(int j =0;j<pro.size();j++){ 
	  					
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t<tr> \r\n");
      out.write("\t  \t\t\t\t\t\t<td><img class=\"img\" src=\"images/");
      out.print(pro.get(j).getPicture() );
      out.write("\"/></td>\r\n");
      out.write("\t  \t\t\t\t\t\t<td>");
      out.print(pro.get(j).getContent() );
      out.write("</td>\r\n");
      out.write("\t  \t\t\t\t\t\t<td>x");
      out.print(pro.get(j).getNum() );
      out.write("</td>\r\n");
      out.write("\t  \t\t\t\t\t\t");
User user = (User)request.getSession().getAttribute("user"); if(user!=null){
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t\t<td>");
      out.print(user.getUsername() );
      out.write("</td> ");
}else{ 
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t\t<td>暂无用户名</td>\r\n");
      out.write("\t  \t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t\t");
 double price =pro.get(j).getPrice() * pro.get(j).getNum();  
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t\t<td>");
      out.print(price );
      out.write("</td>\r\n");
      out.write("\t  \t\t\t\t\t\t<td>");
      out.print(orders.get(i).getStatus() );
      out.write("</td>\r\n");
      out.write("\t  \t\t\t\t\t\t");
if(orders.get(i).getStatus().equals("未付款")) {
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t\t<td><a href=\"submitOrder?price=");
      out.print(price);
      out.write("&no=");
      out.print(orders.get(i).getNo() );
      out.write("\">立即购买</a></td>\r\n");
      out.write("\t  \t\t\t\t\t\t");
}else if(orders.get(i).getStatus().equals("已付款")){ 
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t\t<td>");
      out.print(orders.get(i).getSendOrder() );
      out.write("</td>");
} 
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t</tr>\r\n");
      out.write("\t  \t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t  \t\t\t\t\t\r\n");
      out.write("\t  \t\t\t\t</table>\r\n");
      out.write("\t  \t\t\t</div></td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t  \t\t\r\n");
      out.write("\t  \t\t ");
} 
      out.write(" \r\n");
      out.write("\t  \t\t</table>\r\n");
      out.write("\t  \t</div>\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t  <div id=\"footer\" class=\"row\">\r\n");
      out.write("           <iframe src=\"footer\" scrolling=\"no\" frameborder=\"0\" \r\n");
      out.write("\t\t\tname=\"footer\" class=\"col-sm-12\"></iframe>\r\n");
      out.write("    </div>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}