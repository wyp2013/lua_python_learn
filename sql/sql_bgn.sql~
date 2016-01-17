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