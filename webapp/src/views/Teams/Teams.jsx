import React from 'react';
import {
    Card, CardBody, CardHeader, CardTitle, Table, Row, Col
} from 'reactstrap';
import request from 'superagent';

import { PanelHeader } from 'components';

import { thead, tbody } from 'variables/general';

class Teams extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      teams: []
    }
  }

  componentDidMount(){
    request
      .get('/api/teams')
      .set('Accept', 'application/json')
      .then(res => {
        this.setState({ teams: res.body.data });
      });
  }

    render() {
      return (
        <div>
          <PanelHeader size="sm"/>
          <div className="content">
            <Row>
              <Col xs={12}>
                <Card>
                  <CardHeader>
                    <CardTitle>Teams</CardTitle>
                  </CardHeader>
                  <CardBody>
                    <Table responsive>
                      <thead className="text-primary">
                        <tr>
                          <th>Name</th>
                          <th>Size</th>
                          <th>Team Size</th>
                          <th>Dynamics</th>
                          <th>Practices</th>
                        </tr>
                      </thead>
                      <tbody>
                        {
                          this.state.teams.map(team => {
                            return (
                              <tr key={team.id}>
                              <td>{team.name}</td>
                              <td>{team.size}</td>
                              <td>{team.team_size}</td>
                              <td>{team.dynamics}</td>
                              <td>{team.practices}</td>
                              </tr>
                            )
                          })
                        }
                      </tbody>
                    </Table>
                  </CardBody>
                </Card>
              </Col>
            </Row>
          </div>
        </div>
      );
    }
}

export default Teams;
