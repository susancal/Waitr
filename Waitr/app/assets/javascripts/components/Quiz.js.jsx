  var Quiz = React.createClass({

  getInitialState: function(){
    return {question_count: 0, complete: false, player_one_score: 0}
  },

  nextQuestion: function(){
     this.checkCompletion();
     if (this.state.complete === false) {
     this.setState({question_count: this.state.question_count + 1})
    }
  },

  incrementPlayerOneScore: function(value){
    this.setState({score: this.state.score + value})
  },

  checkCompletion: function(){
      if (this.state.question_count === this.props.questions.length - 1) {
        this.setState({complete: true});
        var summary_url = '/quizzes/' + this.props.quiz_id + '/rounds/' + this.props.round_id + '/summary'
        window.location.replace(summary_url)
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
        <Form round_id={this.props.round_id} party_id={this.props.party_id} question_id={this.props.questions[this.state.question_count].id} incrementPlayerOneScore ={this.incrementPlayerOneScore}/>
        <ScoreBoard/>
      </div>
      )
  }


});
