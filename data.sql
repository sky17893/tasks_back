CREATE TABLE tasks (
    _id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    date TEXT NOT NULL,
    isCompleted BOOLEAN NOT NULL DEFAULT false,
    isImportant BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    userId TEXT NOT NULL
);

select * from tasks;

insert into tasks (_id, title, description, date, isCompleted, isImportant, userId) values ('1234', '빨래하기', '깨끗하게 하기', '2024-11-06', false, false, '0123456789');
insert into tasks (_id, title, description, date, isCompleted, isImportant, userId) values ('1235', '청소하기', '깨끗하게 하기', '2024-11-06', false, false, '0123412312');
insert into tasks (_id, title, description, date, isCompleted, isImportant, userId) values ('1236', '잠자기', '깨끗하게 하기', '2024-11-06', false, false, '9023423423');
insert into tasks (_id, title, description, date, isCompleted, isImportant, userId) values ('1237', '술마시기', '깨끗하게 하기', '2024-11-06', false, false, '0234234343');

select * from tasks where userId = '0123456789' ORDER BY date DESC(ASC)

-- 삭제욤!
DELETE FROM tasks where _id = '1234'

UPDATE tasks SET isCompleted = true Where _id = '1234'

-- 트리거 함수 생성: updated_at 필드를 현재 시간으로 설정
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;




-- 트리거 생성: task 테이블에서 UPDATE가 발생할 때마다 update_updated_at_column 함수를 호출
CREATE TRIGGER update_task_updated_at
BEFORE UPDATE ON tasks
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();




-- task 테이블의 created_at 필드는 행이 처음 삽입될 때만 설정.
-- updated_at 필드는 행이 업데이트될 때마다 트리거를 통해 현재 시간으로 자동 갱신.
-- BEFORE UPDATE 트리거는 레코드가 업데이트되기 직전에 updated_at 필드를 현재 시간으로 변경.


