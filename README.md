<p align="center">
	<a href="https://developerled.substack.com/"><img src="/assets/CommunitySQLBanner.png" alt=""></a>
</p>

# Community SQL

Are you a developer community engineer? Or maybe a developer communty lead? If you're using [Discourse](https://www.discourse.org/) as your community platform, like [OpenAI](https://community.openai.com/), [MongoDB](https://www.mongodb.com/community/forums/), [Cursor](https://forum.cursor.com/), [Cloudflare](https://community.cloudflare.com/) and many others, and at the same time you are on their *Business* or *Enterprise* [tier](https://www.discourse.org/pricing), you should better check out their **[Data Explorer](https://www.discourse.org/plugins/data-explorer)** plugin.

## What is Discourse Data Explorer

[Data Explorer](https://www.discourse.org/plugins/data-explorer) is basically a Discourse *plugin for running SQL queries against your database, allowing for instant stats reporting*. Those queries can be triggered manually via admin dashboard by your platform admin, or you can even build an automation for it and run a set of queries through an API from an external app. You basically turn on the plugin through your admin plugins page and then you can start creating them from scratch in the buil-in editor or import from a `json` file.

<a href="https://www.discourse.org/plugins/data-explorer" title="Discourse Data Explorer Plugin">
	<img src="/assets/DataExplorer.png" alt="">
</a>

## Queries, queries everywhere

[Here](/Queries) you can find a folder with the queries that will allow you to track some key metrics regarding user and content activation and retention, providing you with a high-level overview of where your dev community is, enabling you to build relationships with specific members and making more targeted decisions related to you your content game. Additionally there are some queries for admin related stuff. The queries are grouped into three categories (`high-level`, `member-specific`, `admin`). 

Each query is commented so you can more easily understand it. Additionally there will be queries like measuring the number of active readers (and many others), which you can of course modify based on your own definition.

### 🏗️ High Level Queries 

[Those queries](/Queries/High-Level) will provide overview on overall community health stats.

| Query  |  Context    |
|--------|-------------|
| [Consolidated Pageviews By Month](Queries/High-Level/ConsolidatedPageviewsByMonth.sql) | HiProvides stats for consolidated pageviews for crawlers, logged in and anonymous users by month allowing you to track real number of views coming from your audience |
| [Get Pageviews By Group by Month](/Queries/High-Level/GetPageviewsByGroupByMonth.sql) | Provides a number of pageviews by group by month | 
| [FAQ Views By Month](/Queries/High-Level/FAQViewsByMonth.sql) | Provides number of all FAQ views by month   |
| [Forum High Level Activity Summary](/Queries/High-Level/ForumHighLevelActivitySummary.sql) | Provides a summary of solutions, new users, active users, new topics, FAQ views and reply rate by month |
| [Get Number of Inactive and Active Users](/Queries/High-Level/GetNumberOfInactiveAndActiveUsers.sql) | Provides a number of inactive vs active users | 
| [Get Number of New Posts by Month](/Queries/High-Level/GetNumberOfNewPostsByMonth.sql) | Provides a number of new posts by month | 
| [Get Number of New Topics By Month](/Queries/High-Level/GetNumberOfNewTopicsByMonth.sql)| Provides a number of new topics by month | 
| [Get Number of Topics Solved By Month](/Queries/High-Level/GetNumberOfTopicsSolvedByMonthsql)| Provides a number of topics solved by month | 
| [Get Number of Topics With No Reply](/Queries/High-Level/GetNumberOfTopicsWithNoReply.sql) | Provides a number of topics with no reply by month | 
| [Get Reply Rate](/Queries/High-Level/GetReplyRate.sql) | Provides reply-rate by month (how many threads have at least one reply post excluding the starting one) | 
| [Get Top Active Categories Based on Topics Count](/Queries/High-Level/GetTopActiveCategoriesBasedOnTopicsCount.sql)| Provides top active categories based on topics created count | 
| [Get Total Number of Users By Month](/Queries/High-Level/GetTotalNumberOfUsersByMonth.sql) | Provides a total number of users by month | 
| [Get User Visits By Month](/Queries/High-Level/GetUsersVisitsByMonth.sql) | Provides number of users visits by month |
| [Get Number Of New Users By Month](/Queries/High-Level/GetNumberOfNewUsersByMonth.sql) | Provides number of new users by month | 
| [Get Active Users By Time Period](/Queries/High-Level/GetActiveUsersByTimePeriod.sql)| Provides number of active users (posted at least once) within specific time period |
| [Get Users With No Activity Since Joining](/Queries/High-Level/GetUsersWithNoActivitySinceJoining.sql)| Provides a number of users with no activity since joining | 

### 🔍 Member Specific Queries 

Those are [the queries](/Queries/Member-Specific) that will help you analyze specific users' behaviour.

| Query  |  Context    |
|--------|-------------|
| [Get Active Readers](/Queries/Member-Specific/GetActiveReaders.sql) | Provides a list of active readers for the past month | 
| [Users Leaderboard](/Queries/Member-Specific/UsersLeaderboard.sql) | Provides a leaderboard utilizing a weighted average system (solution: 3 points, reply: 2 points, like given: 1 point) | 
| [Get Users With number of Badges Granted](/Queries/Member-Specific/GetUsersWithNumberOfBadgesGranted.sql)| Provides a list of users with their respective badges count | 
| [Get Users Sending Most DMs](https://github.com/developer-led/community-sql/blob/main/Queries/Member-Specific/GetUsersSendingMostDMs.sql) | Provides a list of users sending most DMs in specified time interval | 
| [Get Users Replies Within Month](/Queries/Member-Specific/GetUsersRepliesWithinMonth.sql)| Provides a list of users with their respective replies count | 
| [Get Top 100 Likers](/Queries/Member-Specific/GetTop100Likers.sql)| Provides a list of Top 100 users liking posts in a specified time range | 
| [Get Number Of Topics Solved By Employees By Month](/Queries/Member-Specific/GetNumberOfTopicsSolvedByEmployeesByMonth.sql)| Provides a list of your employees with their respective solutions count by month | 
| [Get Number Of Solutions By Users Since Account Creation](/Queries/Member-Specific/GetNumberOfSolutionsByUsersSinceAccountCreation.sql)| Provides all-time number of solutions per user | 
| [Get Lurkers](/Queries/Member-Specific/GetLurkers.sql)| Provides a list of lurkers (users reading a lot but not posting) | 

### 🚀 Admin Queries

[Those queries](/Queries/Admin) will allow you to more efficiently create new queries.

| Query  |  Context    |
|--------|-------------|
| [Find Category ID](/Queries/Admin/FindCategoryID.sql)| Provides forum category ID |
| [Get Specific User Info](/Queries/Admin/GetSpecificUserInfo.sql)| Provides specific user info |
| [Get Topics Solved But Not Closed](/Queries/Admin/GetTopicsSolvedButNotClosed.sql) | Provides a list of topics that have been solved but are not closed | 
| [Get User Accounts Emails](/Queries/Admin/GetUsersAccountsEmails.sql) | Provides a list of users' accounts emails |


## Where to find more info

* 💾 [Discourse Data Explorer Official Site](https://www.discourse.org/plugins/data-explorer)
* 📚 [Data Explorer Docs](https://meta.discourse.org/t/discourse-data-explorer/32566)
* 👨🏽‍💻 [Writing Queries & Schema Explorer](https://meta.discourse.org/t/discourse-data-explorer/32566)
* 🔐 [Setting Group Based Access Control for Specific Queries](https://meta.discourse.org/t/discourse-data-explorer/32566)
* 🛠️ [Formatting Data Explorer Table Results](https://meta.discourse.org/t/formatting-data-explorer-table-results/277939)
* 🧠 [Utilizing Parameters in Data Explorer Queries](https://meta.discourse.org/t/utilizing-parameters-in-data-explorer-queries/277934)
* 👩🏼‍🏫 [Data Explorer Tutorial - Part 1](https://meta.discourse.org/t/data-explorer-tutorial-part-1-writing-your-first-query/277925)
* 👨‍🏫 [Data Explorer Tutorial - Part 2](https://meta.discourse.org/t/data-explorer-tutorial-part-2-discourse-sql-basics/277927)

## Developer Led Community

All things devrel, communities, developer marketing and GTM. Up for a weekly read?

<p align="center">
	<a href="https://developerled.substack.com/"><img src="/assets/SubstackSubscribe.png" alt=""></a>
</p>

<p align="center">
	<a href="https://www.linkedin.com/company/developerled/"><img src="https://img.shields.io/static/v1?&color=000000&style=flat&logoColor=white&label=&message=LinkedIn&logo=linkedin" /></a>
	<a href="https://x.com/developerled"><img src="https://img.shields.io/static/v1?&color=000000&style=flat&logoColor=white&label=&message=Twitter&logo=twitter" /></a>
	<a href="https://developerled.substack.com/"><img src="https://img.shields.io/static/v1?&color=000000&style=flat&logoColor=white&label=&message=Substack" /></a>
</p>
