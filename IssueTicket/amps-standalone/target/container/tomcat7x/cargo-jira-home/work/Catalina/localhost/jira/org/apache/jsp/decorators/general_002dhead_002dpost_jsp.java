/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2015-07-21 12:48:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.decorators;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.atlassian.jira.plugin.navigation.HeaderFooterRendering;
import static com.atlassian.jira.component.ComponentAccessor.*;
import com.atlassian.jira.web.pagebuilder.JspDecoratorUtils;

public final class general_002dhead_002dpost_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/WEB-INF/tld/atlassian-jira-tags.tld", Long.valueOf(1431348162000L));
    _jspx_dependants.put("/WEB-INF/tld/webwork.tld", Long.valueOf(1431348162000L));
    _jspx_dependants.put("/includes/decorators/aui-layout/head-common-nodecorator-post.jsp", Long.valueOf(1431348162000L));
    _jspx_dependants.put("/WEB-INF/tld/sitemesh-decorator.tld", Long.valueOf(1431348162000L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    //
    // IDEA gives you a warning below because it cant resolve JspWriter.  I don't know why but its harmless
    //
    HeaderFooterRendering headerFooterRendering = getComponent(HeaderFooterRendering.class);

    // There's no reason to delay an early brow flush, so we leave this for the chin flush (micro optimisation).
    headerFooterRendering.includeGoogleSiteVerification(out);

    // Extra metadata and resources might have been required since the head-pre was written, so we need to drain
    // and write them out.
    headerFooterRendering.includeMetadata(out);
    headerFooterRendering.includeResources(out);

      out.write("\n");
      out.write("<title>");
      out.print( headerFooterRendering.getPageTitle(JspDecoratorUtils.getHead()) );
      out.write("</title>\n");
      out.write("<link rel=\"search\" type=\"application/opensearchdescription+xml\" href=\"");
      out.print( request.getContextPath());
      out.write("/osd.jsp\" title=\"");
      out.print( headerFooterRendering.getPageTitle(JspDecoratorUtils.getHead()) );
      out.write("\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
