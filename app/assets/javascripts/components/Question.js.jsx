var Question = React.createClass({
  render: function(){
    return (
      <h5 className="question-display">{this.props.question.question_text}</h5>
    )
  }

});
