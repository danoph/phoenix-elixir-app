import * as React from 'react';
import * as request from 'superagent';
import './App.css';

import logo from './logo.svg';

interface ITeam {
  dynamics?: number
  name: string
  practices?: number
  size?: number
  team_size?: number
}

class App extends React.Component {
  public state: {
    teams: ITeam[]
  };

  constructor(props: any) {
    super(props);
  }

  public componentDidMount() {
    request
      .get('/api/teams')
      .set('Accept', 'application/json')
      .then(res => {
        this.setState({ teams: res.body.data });
      });
  }

  public render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.tsx</code> and save to reload.
        </p>
      <pre>
        Teams:
        { this.state && this.state.teams.length && this.state.teams[0].name }
      </pre>
      </div>
    );
  }
}

export default App;
