  var Quiz = React.createClass({

  getInitialState: function(){
    return {question_count: 0, complete: false}
  },

  nextQuestion: function(){
     this.checkCompletion();
     if (this.state.complete === false) {
     this.setState({question_count: this.state.question_count + 1})
    }
  },

  checkCompletion: function(){
      if (this.state.question_count === this.props.questions.length - 1) {
        this.setState({complete: true});
        console.log("FINISHED")
      }
  },

  render: function(){
      var question = this.props.questions[this.state.question_count]
      console.log("RENDERING QUIZ - QUESTION #")
      console.log(this.state.question_count)
    return (
      <div>
        <Question question={question}/>
        <QuestionTimer nextQuestion={this.nextQuestion} complete={this.state.complete}/>
        <Form round_id={this.props.round_id} party_id={this.props.party_id} question_id={this.props.questions[this.state.question_count].id}/>
      </div>
      )
  }


});
