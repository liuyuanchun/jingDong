/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.76
 * Generated at: 2018-05-15 14:05:28 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.manage.supplier;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import entity.*;

public final class addSupplierOrder_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write(" <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write(" <script src=\"bootstrap/js/jquery.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write(" <script src=\"bootstrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<body>\r\n");
  
	List<Supplier> supplierList = (List<Supplier>)request.getAttribute("supplierList"); 
	List<Pro> proList = (List<Pro>)request.getAttribute("proList"); 

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div style=\"width:500px;margin:20px auto;height:430px;\">\r\n");
      out.write("  <form action=\"doAddSupplierPro\" method=\"post\" class=\"form-horizontal\" role=\"form\">\r\n");
      out.write(" <div class=\"form-group\">\r\n");
      out.write("   \t\t<label class=\"col-sm-3 control-label\">供&nbsp;&nbsp;应&nbsp;&nbsp;商：</label>\r\n");
      out.write("   \t\t<div class=\"col-sm-5\">\r\n");
      out.write("\t\t\t<select name=\"supplierId\" class=\"form-control sId\">\r\n");
      out.write("\t\t\t<option value=\"-1\">请选择供应商</option>\r\n");
      out.write("\t\t\t");
for(int i = 0 ;i <  supplierList.size();i++){ 
      out.write("\r\n");
      out.write("\t\t\t<option value=\"");
      out.print(supplierList.get(i).getId() );
      out.write('"');
      out.write('>');
      out.print(supplierList.get(i).getSupplierName() );
      out.write("</option>\r\n");
      out.write("\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("   \t\t</div>\r\n");
      out.write("   \t\t<div id=\"publishingmsg\" class=\"col-sm-4\" style=\"color:red;line-height:30px;\"></div>\r\n");
      out.write("  </div>\r\n");
      out.write(" <div class=\"form-group\">\r\n");
      out.write("   \t\t<label class=\"col-sm-3 control-label\">产&nbsp;&nbsp;&nbsp;&nbsp;品：</label>\r\n");
      out.write("   \t\t<div class=\"col-sm-5\">\r\n");
      out.write("\t\t\t<select name=\"proId\" class=\"form-control sId\">\r\n");
      out.write("\t\t\t<option value=\"-1\">请选择产品</option>\r\n");
      out.write("\t\t\t");
for(int i = 0 ;i <  proList.size();i++){ 
      out.write("\r\n");
      out.write("\t\t\t<option value=\"");
      out.print(proList.get(i).getId() );
      out.write('"');
      out.write('>');
      out.print(proList.get(i).getProName() );
      out.write("</option>\r\n");
      out.write("\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("   \t\t</div>\r\n");
      out.write("   \t\t<div id=\"publishingmsg\" class=\"col-sm-4\" style=\"color:red;line-height:30px;\"></div>\r\n");
      out.write("  </div>\r\n");
      out.write("   <div class=\"form-group\">\r\n");
      out.write("   \t\t<label class=\"col-sm-3 control-label\">数量：</label>\r\n");
      out.write("    \t<div class=\"col-sm-5\"><input type=\"number\" name=\"count\"  class=\"form-control\"/></div>\r\n");
      out.write("  </div>\r\n");
      out.write("   <div class=\"form-group\">\r\n");
      out.write("   \t\t<label class=\"col-sm-3 control-label\">备注：</label>\r\n");
      out.write("    \t<div class=\"col-sm-5\"><input type=\"text\" name=\"note\"  class=\"form-control\"/></div>\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"form-group\"  style=\"margin-left:150px;\" >\r\n");
      out.write("  <input type=\"submit\" class=\"btn btn-primary\" value=\"保存\"/>\r\n");
      out.write("  </div>\r\n");
      out.write("  </form>\r\n");
      out.write("  </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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