Q1
create table departments(
  department_id int UNSIGNED auto_increment primary key,
  name varchar(20) not null,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

Q2
alter table people add department_id int unsigned after email;

Q3

INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
('佐藤 健二', 'satou@gizumo.jp', 1, 30, 1),
('鈴木 一郎', 'suzuki_ichi@gizumo.jp', 1, 45, 1),
('高橋 花子', 'takahashi@gizumo.jp', 1, 28, 2),
('田中 太郎', 'tanakatarou@gizumo.jp', 2, 35, 1),
('伊藤 結衣', 'itou@gizumo.jp', 2, 24, 2),
('渡辺 裕太', 'watanabe@gizumo.jp', 2, 29, 1),
('山本 明美', 'yamamoto@gizumo.jp', 2, 32, 2),
('中村 直樹', 'nakamura@gizumo.jp', 3, 40, 1),
('小林 誠', 'kobayasimakoto@gizumo.jp', 4, 38, 1),
('加藤 舞', 'katou@gizumo.jp', 5, 26, 2);

INSERT INTO reports (person_id, content)
VALUES
(10, '新フレームワーク調査'),
(7, '見積書の作成と送付'),
(7, '休眠顧客への再訪'),
(8,'新規顧客への挨拶回り'),
(11,'新機能のバグ修正完了'),
(16,'社内PCのセットアップ'),
(15,'採用面接の評価入力'),
(14,'経費精算の仕訳作業'),
(13,'コードレビュー実施'),
(9,'既存案件の進捗確認');

Q4
update people set department_id = 1 where person_id = 1;
update people set department_id = 2 where person_id = 2;
update people set department_id = 3 where person_id = 3;
update people set department_id = 4 where person_id = 4;
update people set department_id = 5 where person_id = 6;

Q5
select name, age 
from people
where gender = 1
order by age desc;

Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

意味
名前、メール、年齢のカラム（列）を選択
peopleのテーブル（表）から
抜き出すレコードはdepartment_idが１（営業）の部署
作成日時の昇順（古い順）で並び替えをする。

Q7
20代の女性と40代の男性の名前一覧を取得してください。
select name, age, gender
from people
where (gender = 2 and age between 20 and 29)
or (gender =1 and age between 40 and 49);

Q8
営業部に所属する人だけを年齢の昇順で取得してください。
select department_id, age
from people
where department_id = 1
order by age asc;

Q9
開発部に所属している女性の平均年齢を取得してください。
select avg(age) as 'average_age'
from people
where department_id = 2 and gender = 2;

Q10
名前と部署名とその人が提出した日報の内容を同時に取得してください。（日報を提出していない人は含めない）
select people.name, departments.name, reports.content
from people
inner join reports on people.person_id = reports.person_id
inner join departments on people.person_id = departments.department_id;

Q11
日報を一つも提出していない人の名前一覧を取得してください。
select people.name, people.department_id, reports.content
from people
left join reports on people.person_id = reports.person_id
where reports.report_id is null;