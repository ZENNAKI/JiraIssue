package com.example.plugins.tutorial.crud.servlet;

import org.ofbiz.core.entity.GenericValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atlassian.crowd.embedded.api.User;
import com.atlassian.jira.bc.ServiceOutcome;
import com.atlassian.jira.bc.issue.IssueService;
import com.atlassian.jira.bc.issue.search.SearchService;
import com.atlassian.jira.bc.project.ProjectService;
import com.atlassian.jira.datetime.DateTimeFormatter;
import com.atlassian.jira.issue.Issue;
import com.atlassian.jira.issue.changehistory.*;
import com.atlassian.jira.issue.IssueInputParameters;
import com.atlassian.jira.issue.MutableIssue;
import com.atlassian.jira.issue.search.SearchException;
import com.atlassian.jira.jql.builder.JqlClauseBuilder;
import com.atlassian.jira.jql.builder.JqlQueryBuilder;
import com.atlassian.jira.ofbiz.OfBizDelegator;
import com.atlassian.jira.plugin.issuetabpanel.IssueAction;
import com.atlassian.jira.plugin.issuetabpanel.IssueTabPanelModuleDescriptor;
import com.atlassian.jira.project.Project;
import com.atlassian.jira.util.I18nHelper;
import com.atlassian.jira.web.bean.PagerFilter;
import com.atlassian.sal.api.user.UserManager;
import com.atlassian.templaterenderer.TemplateRenderer;
import com.google.common.collect.Maps;
import com.googlecode.jsu.transitionssummary.Transition;
import com.googlecode.jsu.transitionssummary.TransitionSummary;
import com.googlecode.jsu.transitionssummary.issuetabpanel.TransitionsSummaryTabPanel;
import com.googlecode.jsu.transitionssummary.TransitionsManager;
import com.atlassian.jira.issue.changehistory.ChangeHistoryManager;

@SuppressWarnings("serial")
public class IssueCRUD extends HttpServlet  {
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(IssueCRUD.class);

	private IssueService issueService;
	private ProjectService projectService;
	private SearchService searchService;
	private UserManager userManager;
	private TemplateRenderer templateRenderer;
	private com.atlassian.jira.user.util.UserManager jiraUserManager;
	private static final String LIST_BROWSER_TEMPLATE = "/templates/list.vm";
	private static final String NEW_BROWSER_TEMPLATE = "/templates/new.vm";
	private static final String EDIT_BROWSER_TEMPLATE = "templates/edit.vm";
	public TransitionsSummaryTabPanel TS ;
	public ChangeHistoryManager mng ;
	private ChangeHistoryItem test;
	private ChangeHistory chg;
	TransitionsManager tm ;
	private List<ChangeHistory> ch;
	private List<ChangeHistory> ch1;





	public IssueCRUD(IssueService issueService, ProjectService projectService, 
			SearchService searchService, UserManager userManager,
			com.atlassian.jira.user.util.UserManager jiraUserManager,
			TemplateRenderer templateRenderer) {
		this.issueService = issueService;
		this.projectService = projectService;
		this.searchService = searchService;
		this.userManager = userManager;
		this.templateRenderer = templateRenderer;
		this.jiraUserManager = jiraUserManager;
	}
	@SuppressWarnings("deprecation")
	private User getCurrentUser(HttpServletRequest req) {
		// To get the current user, we first get the username from the session.
		// Then we pass that over to the jiraUserManager in order to get an
		// actual User object.
		return jiraUserManager.getUser(userManager.getRemoteUsername(req));
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// Render the list of issues (list.vm) if no params are passed in
		List<Issue> issues = getIssues(req);
		User user = getCurrentUser(req);
		Map<String, Object> context = Maps.newHashMap();
		context.put("issues", issues);
		//ChangeHistoryItem cv ;
		//List<TransitionSummary> transitions ;
		//ch = null;
		//if (issues.size() > 0)
		//for (Issue iss : issues){
		System.out.println("issues.get(0): "+issues.get(0));
		System.out.println("issues.get(0).getCreated(): "+issues.get(0).getCreated());
		context.put("issues1", issues.get(0));
		context.put("issues2", issues.get(0).getCreated());
		//List<Transition> statusChanges = tm.getStatusChanges(issues.get(0), issues.get(0).getCreated());
		//mng.getAllChangeItems(iss);
		/*
			for(int i=0;i<tm.getTransitionSummary(iss).size();i++){
				context.put("transition", tm.getTransitionSummary(iss));

			}*/
		// context.put(iss.getKey(),mng.getChangeHistories(iss));
		//ch1= mng.getChangeHistoriesForUser(iss, user);//getChangeHistories(iss);
		// ch.add(ch1.get(0));
		//}
		//context.put(iss.getKey(), mng.getAllChangeItems(iss));
		//TS.getActions(iss,user);
		//context.put("transition", TS.retList);
		//context.put("transitions", ch);
		resp.setContentType("text/html;charset=utf-8");
		// Pass in the list of issues as the context
		templateRenderer.render(LIST_BROWSER_TEMPLATE, context, resp.getWriter());
	}



	private List<Issue> getIssues(HttpServletRequest req) {
		// User is required to carry out a search
		User user = getCurrentUser(req);

		// search issues
		// The search interface requires JQL clause... so let's build one
		JqlClauseBuilder jqlClauseBuilder = JqlQueryBuilder.newClauseBuilder();
		//JqlQueryBuilder   jqlquerybuilder =  jqlquerybuilder.newBuilder();
		// Our JQL clause is simple project="TUTORIAL"

		com.atlassian.query.Query query = jqlClauseBuilder.savedFilter("Edifixio").buildQuery();//assigneeIsCurrentUser().buildQuery();
		// A page filter is used to provide pagination. Let's use an unlimited filter to
		// to bypass pagination.
		PagerFilter pagerFilter = PagerFilter.getUnlimitedFilter();
		com.atlassian.jira.issue.search.SearchResults searchResults = null;
		try {
			// Perform search results
			searchResults = searchService.search(user, query, pagerFilter);	
		} catch (SearchException e) {
			e.printStackTrace();
		}
		// return the results
		return searchResults.getIssues();
	}

}