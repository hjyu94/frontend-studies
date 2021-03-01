import React, { Component } from 'react';

class UpdateContent extends Component {
    constructor(props) {
        super(props);
        this.state = {
            id: this.props.data.id,
            title: this.props.data.title,
            desc: this.props.data.desc
        }
        this.inputFormatHandler = this.inputFormatHandler.bind(this);
        // onChange={this.inputFormatHandler}.bind(this) -> onChange={this.inputFormatHandler} 로 쓸 수 있음
    }

    inputFormatHandler(e) {
        this.setState({
            [e.target.name]: e.target.value
        });
    }
    
    render() {
        console.log('UpdateContent render');

        return (
            <article>
                <h2>Update</h2>
                <form 
                    action="/create_process" method="post"
                    onSubmit={function(e){
                        e.preventDefault();
                        this.props.onSubmit(this.state.id, this.state.title, this.state.desc);
                    }.bind(this)}
                >
                    <input type="hidden" name="id" value={this.state.id}></input>
                    <p>
                        {/* 아래처럼 prop 를 value 에 넣을 수 없음, prop 은 read-only */}
                        {/* <input 
                            type="text" name="title" placeholder="title" 
                            value={this.props.data.title}>
                        </input> */}
                        <input 
                            type="text" name="title" placeholder="title" 
                            value={this.state.title}
                            onChange={this.inputFormatHandler}
                        >
                        </input>
                    </p>
                    <p>
                        {/* 리액트는 html 이 아니라 유사 html 이므로, 아래처럼 쓸 수 없다 */}
                        {/* <textarea name="desc" placeholder="description">{this.state.desc}</textarea> */}
                        <textarea 
                            name="desc" placeholder="description" value={this.state.desc}
                            onChange={this.inputFormatHandler}
                        ></textarea>
                    </p>
                    <p>
                        <input type="submit"></input>
                    </p>
                </form>
            </article>
        );
    }
}

export default UpdateContent;