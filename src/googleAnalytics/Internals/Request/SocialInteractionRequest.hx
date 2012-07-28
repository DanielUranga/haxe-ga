/**
 * Generic Server-Side Google Analytics PHP Client
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License (LGPL) as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
 * 
 * Google Analytics is a registered trademark of Google Inc.
 * 
 * @link      http://code.google.com/p/php-ga
 * 
 * @license   http://www.gnu.org/licenses/lgpl.html
 * @author    Thomas Bachem <tb@unitedprototype.com>
 * @copyright Copyright (c) 2010 United Prototype GmbH (http://unitedprototype.com)
 */

package  googleAnalytics.internals.request;

import googleAnalytics.SocialInteraction;


class SocialinteractionRequest extends PageviewRequest {
	
	/**
	 * @var googleAnalytics.SocialInteraction
	 */
	private var socialInteraction : googleAnalytics;
	
	
	/**
	 */
	private function getType() : String {
		return Request.TYPE_SOCIAL;
	}
	
	/**
	 * @return googleAnalytics.internals.ParameterHolder
	 */
	private function buildParameters() : googleAnalytics {
		p = super.buildParameters();
		
		p.utmsn  = this.socialInteraction.getNetwork();
		p.utmsa  = this.socialInteraction.getAction();
		p.utmsid = this.socialInteraction.getTarget();
		if(p.utmsid === null) {
			// Default to page path like ga.js,
			// see http://code.google.com/apis/analytics/docs/tracking/gaTrackingSocial.html#settingUp
			p.utmsid = this.page.getPath();
		}
		
		return p;
	}
	
	/**
	 * @return googleAnalytics.SocialInteraction
	 */
	function getSocialInteraction() : googleAnalytics {
		return this.socialInteraction;
	}
	
	/**
	 * @param googleAnalytics.SocialInteraction $socialInteraction
	 */
	function setSocialInteraction(socialInteraction:SocialInteraction) {
		this.socialInteraction = socialInteraction;
	}
	
}
