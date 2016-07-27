  var Quiz = React.createClass({

  getInitialState: function(){
    return {question_count: 0, complete: false, your_score: 0, other_score: 0, answer_status: ""}
  },

  nextQuestion: function(){
     this.checkCompletion();
     if (this.state.complete === false) {
     this.setState({question_count: this.state.question_count + 1})
     this.resetAnswerStatus();
    }
  },

  setYourScore: function(your_new_score){
    this.setState({your_score: your_new_score})
  },

  setOtherScore: function(other_new_score){
    this.setState({other_score: other_new_score})
  },

  checkCompletion: function(){
      if (this.state.question_count === this.props.questions.length - 1) {
        this.setState({complete: true});
        this.saveYourScoreDatabase();
        this.saveOtherScoreDatabase();
      }
  },

  saveYourRoundScoreDatabase: function(){
    url = "/quizzes/" + this.props.quiz_id + "/rounds/" + this.props.roundYou.id
    data = {your_score: this.state.your_score}
    $.ajax({url: url, type: 'PUT', data}).done(function(response){
     console.log(response);
    }.bind(this))
  },

  saveOtherRoundScoreDatabase: function(){
   url = "/quizzes/" + this.props.quiz_id + "/rounds/" + this.props.roundOther.id
    data = {other_score: this.state.other_score}
    $.ajax({url: url, type: 'PUT', data}).done(function(response){
     console.log(response);
    }.bind(this))
  },

  loadSummaryPage: function(){
    var summary_url = '/rounds/key/' + this.props.roundYou.secret_key + '/summary/'
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

  renderStaticQuestionHeader: function(){
      var question = this.props.questions[this.state.question_count]
    return(
        <div className="staticquestionheader">
          <QuestionCount quizlength={this.props.questions.length}questionnumber={this.state.question_count}/>
          <Question question={question}/>
         </div>
      )
  },

  render: function(){
    return (
      <div>
        {this.renderStaticQuestionHeader()}
        <Form question_id={this.props.questions[this.state.question_count].id} updateAnswer={this.updateAnswerStatus} key_number={this.props.key_number}/>
        <QuestionTimer setYourScore ={this.setYourScore}nextQuestion={this.nextQuestion} complete={this.state.complete} setOtherScore ={this.setOtherScore}  keynum={this.props.roundYou.secret_key} goToSummary={this.loadSummaryPage} roundOther={this.props.roundOther}/>
        <ScoreBoard yourScore={this.state.your_score} otherScore={this.state.other_score}/>
      </div>
      )
  }

});
