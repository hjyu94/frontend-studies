import React, { Component } from 'react';
import TOC from './components/TOC'
import ReadContent from './components/ReadContent'
import CreateContent from './components/CreateContent'
import Subject from './components/Subject'
import Control from './components/Control'
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mode:'read',
      selected_content_id:1,
      subject: {title: 'WEB', sub:'World wide web!'},
      welcome:{title:'welcome', desc:'Hello, React!!!'},
      contents:[
        {id:1, title:'HTML', desc:'HTML is HypterText ...'},
        {id:2, title:'CSS', desc:'CSS is for design ...'},
        {id:3, title:'JavaScript', desc:'Javascript is for interactive ...'},
      ]
    }
  }

  render() {
    console.log('App render');
    
    var _title, _desc, _article = null;
    
    if(this.state.mode === 'welcome') {
      _title = this.state.welcome.title;
      _desc = this.state.welcome.desc;
      _article = <ReadContent title={_title} desc={_desc}></ReadContent>

    } else if(this.state.mode === 'read') {
      var i = 0;
      while(i < this.state.contents.length) {
        var data = this.state.contents[i];
        if (data.id === Number(this.state.selected_content_id)) {
          _title = this.state.contents[i].title;
          _desc = this.state.contents[i].desc;
          break;
        }
        i = i + 1;
      }
      _article = <ReadContent title={_title} desc={_desc}></ReadContent>
    } else if(this.state.mode === 'create') {
      _article = <CreateContent onSubmit={function(_title, _desc){
        // add content to this.state.contents
        debugger;
      }.bind(this)}></CreateContent>
    }

    return (
      <div className="App">
        <Subject 
          title={this.state.subject.title} 
          sub={this.state.subject.sub}
          onChangePage={function(){
            this.setState({
              mode: 'welcome'
            });
          }.bind(this)}
        ></Subject>
        <Control
          onChangeMode={function(_mode){
            this.setState({
              mode: _mode
            });
          }.bind(this)}
        ></Control>
        <TOC 
          data={this.state.contents}
          onChangePage={function(id){
            this.setState({
              mode: 'read',
              selected_content_id: id
            })
          }.bind(this)}
        ></TOC>
        { _article }
      </div>
    );
  }
}

export default App;
