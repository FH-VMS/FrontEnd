import React, { Component } from 'react'

export default class NotFound extends Component {
  static contextTypes = {
    router: React.PropTypes.object.isRequired
  }

  componentWillMount() {
    this.context.router.replace('/')
  }

  render () {
    // 非实体组件需显式返回 null
    return null
  }
}
