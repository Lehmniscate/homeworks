import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      num1: "",
      num2: "",
      result: 0
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.divide = this.divide.bind(this);
    this.multiply = this.multiply.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    this.setState({num1: e.target.value});
  }

  setNum2(e) {
    e.preventDefault();
    this.setState({num2: e.target.value});
  }

  add(e) {
    e.preventDefault();
    this.setState({
      result: (this.state.num1 * 1) + (this.state.num2 * 1)
    });
  }
  subtract(e) {
    e.preventDefault();
    this.setState({
      result: this.state.num1 - this.state.num2
    });
  }
  divide(e) {
    e.preventDefault();
    this.setState({
      result: (this.state.num1 / this.state.num2)
    });
  }
  multiply(e) {
    e.preventDefault();
    this.setState({
      result: (this.state.num1 * this.state.num2)
    });
  }

  clear(e) {
    e.preventDefault();
    this.setState({num1: "", num2: "", result: 0});
  }

  render() {
    const {result, num1, num2} = this.state;
    return (
      <div>
        <h1>
          {result}
        </h1>
        <input value={num1} onChange={this.setNum1}></input>
        <input value={num2} onChange={this.setNum2}></input>
        <button onClick={this.add}>Add</button>
        <button onClick={this.subtract}>Subtract</button>
        <button onClick={this.divide}>Divide</button>
        <button onClick={this.multiply}>Multiply</button>
        <button onClick={this.clear}>Clear</button>
      </div>
    )
  }
}

export default Calculator;
