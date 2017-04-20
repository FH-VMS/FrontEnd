import React, { Component } from 'react'
import {Link} from 'react-router'
import logo from 'ASSET/img/admin/logo.png'
import Model from 'STORE/model'

export default class Header extends Component {
	constructor(props) {
		super(props)
	}

	componentDidMount() {
         
	}

	gotoUserCenter = e =>{
      window.open(Model.Front.Setting.UserCenter)
    }

	mouseOver = (e) => {
       $('.adminLoginStyle').find('.normalDisplayNone').slideDown(200)
	}

	mouseOut = (e) => {
		$('.adminLoginStyle').find('.normalDisplayNone').slideUp(200)
	}

	render() {
		return (
			<header className="adminHeader">
				<div><Link to="/"><img src={logo} /></Link></div>
				<div className="rightHeader">
					<div></div>
					<div>
						<div className="adminLoginStyle" onMouseLeave={this.mouseOut} onMouseEnter={this.mouseOver}>
                            <div>{this.props.userInfoSource.partyname} <span className="fa fa-chevron-down"></span></div>
							<ul className="normalDisplayNone">
                                <li>{this.props.userInfoSource.partyname} <span className="fa fa-chevron-down"></span></li>
								<li onClick={this.gotoUserCenter}>会员中心</li>
								<li onClick={this.props.loginout}>退出</li>
							</ul>

						</div>
					</div>
				</div>
			</header>
		)
	}
}
