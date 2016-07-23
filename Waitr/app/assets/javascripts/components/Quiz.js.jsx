  var Quiz = React.createClass({

  getInitialState: function(){
    return {question_id: 0, complete: false}
  },

  nextQuestion: function(){
     this.checkCompletion();
     if (this.state.complete === false) {
     this.setState({question_id: this.state.question_id + 1})
    }
  },

  checkCompletion: function(){
      if (this.state.question_id === this.props.questions.length - 1) {
        this.setState({complete: true});
        console.log("FINISHED")
      }
  },

  render: function(){
      var question = this.props.questions[this.state.question_id]
      console.log("RENDERING QUIZ - QUESTION #")
      console.log(this.state.question_id)
    return (
      <div>
        <Question question={question}/>
        <QuestionTimer nextQuestion={this.nextQuestion} complete={this.state.complete}/>
        <Form/>
      </div>
      )
  }


});
