import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questionCount,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json) :
    id = json['id'] as String,
    title = json['title'] as String,
    imageUrl = json['image_url'] as String,
    description = json['Description'] as String,
    timeSeconds = json['time_seconds'],
    questionCount = 0,
    questions = (json['questions'] as List).map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>)).toList();

  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) :
    id = json['id'],
    title = json['title'],
    imageUrl = json['image_url'],
    description = json['Description'],
    timeSeconds = json['time_seconds'],
    questionCount = json['question_count'] as int,
    questions = [];

  String description;
  String id;
  String? imageUrl;
  int questionCount;
  List<Questions>? questions;
  int timeSeconds;
  String title;

  String timeInMinutes() => "${(timeSeconds / 60).ceil()} mins";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    return data;
  }
}

class Questions {
  Questions({required this.id, required this.question, required this.answers, this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    question = json['question'],
    answers = (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
    correctAnswer = json['correct_answer'];

  List<Answers> answers;
  String? correctAnswer;
  String id;
  String question;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json) :
    identifier = json['identifier'],
    answer = json['Answer'];

  String? answer;
  String? identifier;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}