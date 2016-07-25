  var Quiz = React.createClass({

  getInitialState: function(){
    return {question_count: 0, complete: false, player_score: 0, answer_status: "Waiting For Answer"}
  },

  nextQuestion: function(){
     this.checkCompletion();
     if (this.state.complete === false) {
     this.setState({question_count: this.state.question_count + 1})
     this.resetAnswerStatus();
    }
  },

  incrementPlayerScore: function(){
    this.setState({player_score: this.state.player_score + 1})
  },

  checkCompletion: function(){
      if (this.state.question_count === this.props.questions.length - 1) {
        this.setState({complete: true});
        this.saveScoreDatabase();
        this.loadSummaryPage();
      }
  },

  saveScoreDatabase: function(){
    url = "/quizzes/" + this.props.quiz_id + "/rounds/" + this.props.round_id
    data = {player_score: this.state.player_score}

    $.ajax({url: url, type: 'PUT', data}).done(function(response){
     console.log(response);
    }.bind(this))
  },

  loadSummaryPage: function(){
    var summary_url = '/quizzes/' + this.props.quiz_id + '/rounds/' + this.props.round_id + '/summary'
    window.location.replace(summary_url)
  },

  updateAnswerStatus: function(){
    this.setState({answer_status: "Answer Saved"})
    $('button').addClass('btn disabled')
  },

  resetAnswerStatus: function(){
    this.setState({answer_status: "Waiting For Answer"})
    $('button').removeClass('btn disabled')
    $('button').addClass('btn waves-effect waves-light')
    $('h2#guess-status').removeClass("guess-status-saved")
    $('h2#guess-status').addClass("guess-status-waiting")
  },

  render: function(){
      var question = this.props.questions[this.state.question_count]
    return (
      <div>
        <QuestionCount quizlength={this.props.questions.length}questionnumber={this.state.question_count}/>
        <Question question={question}/>
        <QuestionTimer nextQuestion={this.nextQuestion} complete={this.state.complete}/>
        <Form round_id={this.props.round_id} party_id={this.props.party_id} question_id={this.props.questions[this.state.question_count].id} incrementPlayerScore ={this.incrementPlayerScore} updateAnswer={this.updateAnswerStatus}/>

        <ScoreBoard playerScore={this.state.player_score}/>
      </div>
      )
  }


});
