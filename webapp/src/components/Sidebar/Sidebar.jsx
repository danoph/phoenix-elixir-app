import React from 'react';
import { NavLink } from 'react-router-dom';
import { Nav } from 'reactstrap';
// javascript plugin used to create scrollbars on windows
import PerfectScrollbar from 'perfect-scrollbar';
import request from 'superagent';

import logo from "logo-white.svg";

var ps;

class Sidebar extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      teams: []
    }

    this.activeRoute.bind(this);
  }

  // verifies if routeName is the one active (in browser input)
  activeRoute(routeName) {
    return this.props.location.pathname.indexOf(routeName) > -1 ? 'active' : '';
  }

  componentDidMount(){
    request
      .get('/api/teams')
      .set('Accept', 'application/json')
      .then(res => {
        this.setState({ teams: res.body.data });
      });

    if(navigator.platform.indexOf('Win') > -1){
      ps = new PerfectScrollbar(this.refs.sidebar,{suppressScrollX: true, suppressScrollY: false});
    }
  }

  componentWillUnmount(){
    if(navigator.platform.indexOf('Win') > -1){
      ps.destroy();
    }
  }

  render(){
    return (
      <div className="sidebar" data-color="blue">
        <div className="logo">
          <a href="#" className="simple-text logo-mini">
            <div className="logo-img">
              <img src={logo} alt="react-logo" />
            </div>
          </a>
          <a href="#" className="simple-text logo-normal">
            Teams
          </a>
        </div>

        <div className="sidebar-wrapper" ref="sidebar">
          <Nav>
            { this.state.teams.map(team => this.renderTeam(team)) }

            {
              this.props.routes.map((prop,key) => {
                if(prop.redirect)
                  return null;
                return (
                  <li className={this.activeRoute(prop.path) + (prop.pro ? " active active-pro":"")} key={key}>
                  <NavLink to={prop.path} className="nav-link" activeClassName="active">
                  <i className={"now-ui-icons "+prop.icon}></i>
                  <p>{prop.name}</p>
                  </NavLink>
                  </li>
                );
              })
            }
          </Nav>
        </div>
      </div>
  );
  }

  renderTeam(team: ITeam) {
    return (
      <li key={team.id}>
      <NavLink to="#" className="nav-link">
        <i className={"now-ui-icons users_single-02"}></i>
        <p>{ team.name }</p>
      </NavLink>
      </li>
    );
  }
}

export default Sidebar;
