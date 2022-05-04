// Copyright (c) 2020-2021 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by a GPL license that can be found in the LICENSE file.
module main

import vweb
import json

['/api/:user/:repo/issues']
pub fn (mut app App) handle_api_issues(user string, repo string) vweb.Result {
	if !app.exists_user_repo(user, repo) {
		return app.json('{}')
	}

	issues := app.get_all_repo_issues(app.repo.id)

	return app.json(json.encode(issues))
}

['/api/:user/:repo/commits']
pub fn (mut app App) handle_api_commits(user string, repo string) vweb.Result {
	if !app.exists_user_repo(user, repo) {
		return app.json('{}')
	}

	commits := app.get_last_repo_commits(app.repo.id)

	return app.json(json.encode(commits))
}