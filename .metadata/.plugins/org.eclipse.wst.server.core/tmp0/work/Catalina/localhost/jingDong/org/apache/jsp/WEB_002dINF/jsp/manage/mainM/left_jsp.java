/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.76
 * Generated at: 2018-05-15 13:37:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.manage.mainM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class left_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');

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
      out.write("    \r\n");
      out.write("    <title>My JSP 'left.jsp' starting page</title>\r\n");
      out.write("    \r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">\r\n");
      out.write("\t<meta http-equiv=\"description\" content=\"This is my page\">\r\n");
      out.write("\t<!--\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">\r\n");
      out.write("\t-->\r\n");
      out.write("<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <script src=\"bootstrap/js/jquery.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("    <script src=\"bootstrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("    <Style>\r\n");
      out.write("    #accordion{\r\n");
      out.write("    \tmargin-top:20px;\r\n");
      out.write("    \twidth:200px;\r\n");
      out.write("    \t background-color: #FFFFF0 ;\r\n");
      out.write("    }\r\n");
      out.write("    #accordion a{\r\n");
      out.write("    text-decoration:none;\r\n");
      out.write("    }\r\n");
      out.write("    .panel-title,.panel-body{\r\n");
      out.write("    \ttext-align:center;\r\n");
      out.write("    }\r\n");
      out.write("    .panel-body a{\r\n");
      out.write("    \tcursor:pointer;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    </Style>\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body>\r\n");
      out.write("    <div class=\"panel-group\" id=\"accordion\">\r\n");
      out.write("    <div class=\"panel panel-default\">\r\n");
      out.write("        <div class=\"panel-heading\">\r\n");
      out.write("            <h4 class=\"panel-title\">\r\n");
      out.write("                <a data-toggle=\"collapse\" data-parent=\"#accordion\" \r\n");
      out.write("                href=\"#product\">商品管理</a>\r\n");
      out.write("            </h4>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"product\" class=\"panel-collapse collapse\">\r\n");
      out.write("            <div class=\"panel-body\"><a href=\"showMProduct\" target=\"right\">显示商品</a></div>\r\n");
      out.write("            <div class=\"panel-body\"><a href=\"showMAddProduct\" target=\"right\">添加商品</a></div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("       <div class=\"panel panel-default\">\r\n");
      out.write("        <div class=\"panel-heading\">\r\n");
      out.write("            <h4 class=\"panel-title\">\r\n");
      out.write("                <a data-toggle=\"collapse\" data-parent=\"#accordion\" \r\n");
      out.write("                href=\"#type\">商品类别管理</a>\r\n");
      out.write("            </h4>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"type\" class=\"panel-collapse collapse\">\r\n");
      out.write("            <div class=\"panel-body\"><a href=\"showMType\" target=\"right\">管理商品分类</a></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"panel panel-default\">\r\n");
      out.write("        <div class=\"panel-heading\">\r\n");
      out.write("            <h4 class=\"panel-title\">\r\n");
      out.write("                <a data-toggle=\"collapse\" data-parent=\"#accordion\" \r\n");
      out.write("                href=\"#message\">用户信息管理</a>\r\n");
      out.write("            </h4>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"message\" class=\"panel-collapse collapse\">\r\n");
      out.write("       \t\t<div class=\"panel-body\"><a href=\"showMUser\" target=\"right\">修改用户信息</a></div>\r\n");
      out.write("            <div class=\"panel-body\"><a href=\"showModifyMpwd\" target=\"right\">修改密码</a></div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"panel panel-default\">\r\n");
      out.write("        <div class=\"panel-heading\">\r\n");
      out.write("            <h4 class=\"panel-title\">\r\n");
      out.write("                <a data-toggle=\"collapse\" data-parent=\"#accordion\" \r\n");
      out.write("                href=\"#order\">订单管理</a>\r\n");
      out.write("            </h4>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"order\" class=\"panel-collapse collapse\">\r\n");
      out.write("            <div class=\"panel-body\"><a  href=\"showMOrder\" target=\"right\">显示订单</a></div>\r\n");
      out.write("           \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("   \r\n");
      out.write("       <div class=\"panel panel-default\">\r\n");
      out.write("        <div class=\"panel-heading\">\r\n");
      out.write("            <h4 class=\"panel-title\">\r\n");
      out.write("                <a data-toggle=\"collapse\" data-parent=\"#accordion\" \r\n");
      out.write("                href=\"#supplier\">供货商管理</a>\r\n");
      out.write("            </h4>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"supplier\" class=\"panel-collapse collapse\">\r\n");
      out.write("            <div class=\"panel-body\"><a  href=\"showMSupplier\" target=\"right\">展示供货商</a></div>\r\n");
      out.write("            <div class=\"panel-body\"><a  href=\"showAddSupplierPage\" target=\"right\">增加供货商</a></div>\r\n");
      out.write("            \r\n");
      out.write("           \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("           <div class=\"panel panel-default\">\r\n");
      out.write("        <div class=\"panel-heading\">\r\n");
      out.write("            <h4 class=\"panel-title\">\r\n");
      out.write("                <a data-toggle=\"collapse\" data-parent=\"#accordion\" \r\n");
      out.write("                href=\"#supplierOrder\">订货管理</a>\r\n");
      out.write("            </h4>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"supplierOrder\" class=\"panel-collapse collapse\">\r\n");
      out.write("            <div class=\"panel-body\"><a  href=\"showMSupplierOrder\" target=\"right\">展示订货记录</a></div>\r\n");
      out.write("            <div class=\"panel-body\"><a  href=\"showAddMSupplierOrder\" target=\"right\">新增订货记录</a></div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
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
