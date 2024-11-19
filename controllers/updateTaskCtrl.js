const database = require("../database/database");
//const { v4: uuid4 } = require("uuid");

exports.updateTask = async (request, response) => {
  //const _id = uuid4();
  const { title, description, date, isCompleted, isImportant, id } =
    request.body;
  console.log(title, description, date, isCompleted, isImportant, id); // body에 요청한 데이터 확인용 코드

  try {
    await database.pool.query(
      "UPDATE tasks SET title = $1, description = $2, date = $3, isCompleted = $4, isImportant = $5 Where _id = $6",
      [title, description, date, isCompleted, isImportant, id]
    );

    return response.status(200).json({ msg: "데이터가 수정?되었습니다." });
  } catch (error) {
    return response.status(500).json({ msg: "데이터 수정 에러: " + error });
  }
};

exports.updateCompletedTask = async (request, response) => {
  //const _id = uuid4();
  const { isCompleted, id } = request.body;
  console.log(isCompleted, id); // body에 요청한 데이터 확인용 코드

  try {
    await database.pool.query(
      "UPDATE tasks SET isCompleted = $1 Where _id = $2",
      [isCompleted, id]
    );

    return response.status(200).json({ msg: "완료 여부가 변경되었습니다." });
  } catch (error) {
    return response.status(500).json({ msg: "데이터 입력 에러: " + error });
  }
};
