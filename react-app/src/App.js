import React, { Component } from 'react';
import TOC from './components/TOC'
import ReadContent from './components/ReadContent'
import CreateContent from './components/CreateContent'
import UpdateContent from './components/UpdateContent'
import Subject from './components/Subject'
import Control from './components/Control'
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.max_content_id = 3; // rendering 과 연관이 없으므로 state 로 두지 않는다
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

  getReadContent() {
    var i = 0;
    while(i < this.state.contents.length) {
      var data = this.state.contents[i];
      if (data.id === Number(this.state.selected_content_id)) {
        return data;
      }
      i = i + 1;
    }
  }
  
  getContent() {
    var _title, _desc, _article = null;

    if(this.state.mode === 'welcome') {
      _title = this.state.welcome.title;
      _desc = this.state.welcome.desc;
      _article = <ReadContent title={_title} desc={_desc}></ReadContent>

    } else if(this.state.mode === 'read') {
      var _content = this.getReadContent();
      _article = <ReadContent title={_content.title} desc={_content.desc}></ReadContent>
    
    } else if(this.state.mode === 'create') {
      _article = <CreateContent onSubmit={function(_title, _desc){
        // add content to this.state.contents
        this.max_content_id = this.max_content_id + 1;
        // this.state.contents.push (
        //   {id:this.max_content_id, title:_title, desc:_desc}
        // );
        // this.setState({
        //   contets: this.state.contents
        // });
        // 위 방법말고
        // 원본 데이터를 바꾸지 않으면서 content 를 갱신시켜 줘야
        // 리액트의 퍼포먼스 리팩토링이 편리해진다.
        var _contents = this.state.contents.concat(
          {id:this.max_content_id, title:_title, desc:_desc}
        );
        this.setState({
          contents: _contents
        });
      }.bind(this)}></CreateContent>
    
    } else if(this.state.mode === 'update') {
      var _content = this.getReadContent();
      _article = <UpdateContent data={_content}></UpdateContent>
    }

    return _article;
  }

  render() {
    console.log('App render');
    
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
        { this.getContent() }
      </div>
    );
  }
}

export default App;
