var Quiz = React.createClass({

  getInitialState: function(){
    return {question_id: 0, timer: 15 }
  },

  nextQuestion: function(){
    this.setState({question_id: this.state.question_id + 1})
  },

  render: function(){
      var question = this.props.questions[this.state.question_id]
      console.log(question)
      console.log(this.state.question_id)
    return (
      <div>
        <Question question={question}/>
        <QuestionTimer nextquestion={this.nextQuestion}/>
      </div>
      )

  }


});