var QuestionCount = React.createClass({
  render: function(){
    return (
      <h5 className="question-count"> Question {this.props.questionnumber + 1}/{this.props.quizlength}</h5>
      )


  }





});