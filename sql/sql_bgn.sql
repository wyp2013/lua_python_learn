alter table celebs add column twitter_handle text; //添加一列
update celebs set twitter_handle = '@wyp13' where id = 4;
delete from celebs where twitter_handle is null;//删除
select distinct genre from movies;

select * from movies where name like 'Se_en';
select * from movies where name between 'A' and 'J'; //查询name开头以A-J,但不包括J的电影
select * from movies where year between 1990 and 2000;
select * from movies where year between 1990 and 2000 and genery = 'comedy';
select * from movies order imdb_rating desc;
select * from movies order imdb_rating asc limit 3;

select count(*) from fake_apps;
select count(*) from fake_apps where price = 0;
select price, count(*) from fake_apps group by price; //统计每种价格的app应用有多少个
select price, count(*) as total from fake_apps where downloads > 20000 group by price;//
select category, sum(downloads) from fake_apps group by category;//
select *, max(downloads) from fake_apps;//找出最大下载量的apps
select name, category, max(downloads) from fake_apps group by category;//找出每类中最大下载量的app name

Return the names of the apps that have been downloaded the least number of times in each category. Type
select name, category, min(downloads) from fake_apps group by category;
select category, avg(downloads) from fake_apps group by category;
Make the result set more readable by rounding the average number of downloads to two decimal places for each price
select price, round(avg(downloads), 2) from fake_apps group by price;//
SELECT price, ROUND(AVG(downloads)) FROM fake_apps GROUP BY price;

create table artists(id INTEGER primary key, name text);//
select * from albums join artists on albums.artist_id = artists.id;//这里是一个inner join
select * from albums left join artists on albums.artist_id = artists.id;
select 
albums.name as 'album',
albums.year,
artists.name as 'artist'
from albums join artists on albums.artist_id = artists.id
where albums.year > 1980; //查询的时候一般用内连接，外链接不要求一定要满足条件，不满足条件的返回null

https://www.codecademy.com/zh/courses/sql-analyzing-business-metrics/lessons/advanced-aggregates/exercises/daily-count-ii?action=resume
select date(ordered_at), count(1)
from orders
group by 1
order by 1;
We now have the daily order count!
The order by 1 and group by 1 statements are shortcuts for order by date(ordered_at) and group by date(ordered_at).

//查询每天的总收入
select date(ordered_at), round(sum(amount_paid), 2)
from orders
    join order_items on 
      orders.id = order_items.order_id
group by 1
order by 1;

//查询wyp每天的消费
select date(ordered_at), round(sum(amount_paid), 2)
from orders
    join order_items on 
      orders.id = order_items.order_id
where name = 'wyp'
group by 1
order by 1;

//计算没类收益占总收益的百分比
select name, round(sum(amount_paid)/(select sum(amount_paid) from order_items)*100.0, 2) as pct
from order_items
group by 1
order by 2 desc;

分类
case {condition}
  when {value1} then {result1}
  when {value2} then {result2}
  else {result3}
end

select *,
case name
    when 'kale-smoothie'    then 'smoothie'
    when 'banana-smoothie'  then 'smoothie'
    when 'orange-juice'     then 'drink'
    when 'soda'             then 'drink'
    when 'blt'              then 'sandwich'
    when 'grilled-cheese'   then 'sandwich'
    when 'tikka-masala'     then 'dinner'
    when 'chicken-parm'     then 'dinner'
     else 'other'
  end as category
from order_items
order by id
Note that the else 'other' block catches all the products that don't meet the previous conditions.

select
  case name
    when 'kale-smoothie'    then 'smoothie'
    when 'banana-smoothie'  then 'smoothie'
    when 'orange-juice'     then 'drink'
    when 'soda'             then 'drink'
    when 'blt'              then 'sandwich'
    when 'grilled-cheese'   then 'sandwich'
    when 'tikka-masala'     then 'dinner'
    when 'chicken-parm'     then 'dinner'
    else 'other'
  end as category, round(1.0 * sum(amount_paid) /
    (select sum(amount_paid) from order_items) * 100, 2) as pct
from order_items
group by 1
order by 2 desc;

select
  case name
    when 'kale-smoothie'    then 'smoothie'
    when 'banana-smoothie'  then 'smoothie'
    when 'orange-juice'     then 'drink'
    when 'soda'             then 'drink'
    when 'blt'              then 'sandwich'
    when 'grilled-cheese'   then 'sandwich'
    when 'tikka-masala'     then 'dinner'
    when 'chicken-parm'     then 'dinner'
    else 'other'
  end as category, round(1.0 * sum(amount_paid) /
    (select sum(amount_paid) from order_items) * 100, 2) as pct
from order_items
group by 1
order by 2 desc;

orders          4999 rows
id	            int
ordered_at	    text
delivered_at	text
delivered_to	int

order_items     20000 rows
id	            int
order_id	    int
name	        text
amount_paid	    real

select name, count(distinct(order_id))
from order_items
group by 1
order by 1;
select count(distinct(order_id)) from order_items where name = 'cake'; 

select name, round(1.0 * count(distinct(order_id)) /
  count(delivered_to), 2) as reorder_rate
from order_items
  join orders on
    orders.id = order_items.order_id
group by 1
order by 2 desc; //每种食品订购的频率


purchases       2000 rows
id	            int
user_id	        int
price	        real
refunded_at	    text
created_at	    text

gameplays       14000 rows
id	            int
user_id	        int
created_at	    text
platform	    text

1.Daily Revenue is simply the sum of money made per day.
select
  date(created_at),
  round(sum(price), 2)
from purchases
group by 1
order by 2;

1.Update our daily revenue query to exclude refunds. Complete the query by filtering for refunded_at is not null.
select
  date(created_at),
  round(sum(price), 2) as daily_rev
from purchases
where refunded_at is null
group by 1
order by 1;

1.For Mineblocks, we'll use the gameplays table to calculate DAU. Each time a user plays the game, their session is recorded in gameplays. 
Thus, a distinct count of users per day from gameplays will give us DAU.
select
  date(created_at),
  count(distinct(user_id)) as dau
from gameplays
group by 1
order by 1;

1.
Previously we calculated DAU only per day, so the output we wanted was [date, dau_count]. Now we want DAU per platform, 
making the desired output [date, platform, dau_count].
select
  date(created_at),
  platform,
  count(distinct(user_id)) as dau
from gameplays
group by 1,2
order by 1,2;

Daily ARPPU is defined as the sum of revenue divided by the number of purchasers per day.
1.To get Daily ARPPU, modify the daily revenue query from earlier to divide by the number of purchasers.
select
  date(created_at),
  round(sum(price) / count(distinct(user_id)), 2) as arppu
from purchases
where refunded_at is null
group by 1
order by 1;

1.
Use a with clause to define daily_revenue and then select from it.
with daily_revenue as (
  select
     date(created_at) as dt,
     round(sum(price), 2) as rev
  from purchases
  where refunded_at is null
  group by 1
)
select * from daily_revenue order by dt;

1.Building on this CTE, we can add in DAU from earlier. Complete the query by calling the DAU query we created earlier, now aliased as daily_players:
with
daily_revenue as (
  select
    date(created_at) as dt,
    round(sum(price), 2) as rev
  from purchases
  where refunded_at is null
  group by 1
), 
daily_players as (
  select
    date(created_at) as dt,
    count(distinct(user_id)) as players
  from gameplays
  group by 1
)
select * from daily_players order by dt;

2.Now that we have the revenue and DAU, join them on their dates and calculate daily ARPU. Complete the query by adding the keyword using in the join clause.
with
daily_revenue as (
  select
    date(created_at) as dt,
    round(sum(price), 2) as rev
  from purchases
  where refunded_at is null
  group by 1
), 
daily_players as (
  select
     date(created_at) as dt,
     count(distinct(user_id)) as players
  from gameplays
  group by 1
)
select 
  daily_revenue.dt,
  daily_revenue.rev / daily_players.players as revv
from daily_revenue
  join daily_players using (dt) //on daily_revenue.dt = daily_players.dt//;
  
Nice work, you just defined ARPU for Mineblocks!

In our ARPU query, we used using instead of on in the join clause. This is a special case join.

from daily_revenue
  join daily_players using (dt);

When the columns to join have the same name in both tables you can use using instead of on. Our use of the using keyword is in this case equivalent to this clause:

from daily_revenue
  join daily_players on
    daily_revenue.dt = daily_players.dt;
	
1.Now we'll join gameplays on itself so that we can have access to all gameplays for each player, for each of their gameplays.
select
  date(g1.created_at) as dt,
  g1.user_id
from gameplays as g1
  join gameplays as g2 on
    g1.user_id = g2.user_id
order by 1
limit 100;

1.
1 Day Retention is defined as the number of players who returned the next day divided by the number of original players, per day. Suppose 10 players played Mineblocks on Dec 10th. 
If 4 of them play on Dec 11th, the 1 day retention for Dec 10th is 40%.
	1.
The previous query joined all rows in gameplays against all other rows for each user, making a massive result set that we don't need.

We'll need to modify this query.

select
  date(g1.created_at) as dt,
  g1.user_id,
  g2.user_id
from gameplays as g1
  join gameplays as g2 on
    g1.user_id = g2.user_id
    and /**/
order by 1
limit 100;

Complete the query above such that the join clause includes a date join:

date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))

This means "only join rows where the date in g1 is one less than the date in g2", which makes it possible to see if users have returned!
select
  date(g1.created_at) as dt,
  g1.user_id,
  g2.user_id
from gameplays as g1
  join gameplays as g2 on                       
    g1.user_id = g2.user_id
    and  date(g1.created_at) = 
         date(datetime(g2.created_at, '-1 day'))
order by 1
limit 100; //改成左连接看看，左连接会保留不匹配的行，右链接是完全相同

2.
The query above won't return meaningful results because we're using an inner join. This type of join requires that the condition be met for all rows, effectively limiting our selection to only the users that have returned.

Instead, we want to use a left join, this way all rows in g1 are preserved, leaving nulls in the rows from g2 where users did not return to play the next day.

Change the join clause to use left join and count the distinct number of users from g1 and g2 per date.

select
  date(g1.created_at) as dt,
  count(distinct g1.user_id) as total_users,
  count(distinct g2.user_id) as retained_users
from gameplays as g1
  /**/ gameplays as g2 on
    g1.user_id = g2.user_id
    and date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))
group by 1
order by 1
limit 100;
select
  date(g1.created_at) as dt,
  count(distinct g1.user_id) as total_users,
  count(distinct g2.user_id) as retained_users
from gameplays as g1
   left join gameplays as g2 on
    g1.user_id = g2.user_id
    and date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))
group by 1
order by 1
limit 100;//这里用的是左连接

3.Now that we have retained users as count(distinct g2.user_id) and total users as count(distinct g1.user_id),
divide retained users by total users to calculate 1 day retention!
select
  date(g1.created_at) as dt,
  round(100 * count(distinct g2.user_id) /
    count(distinct g1.user_id)) as retention
from gameplays as g1
  left join gameplays as g2 on
    g1.user_id = g2.user_id
    and date(g1.created_at) = date(datetime(g2.created_at, '-1 day'))
group by 1
order by 1
limit 100;
	
