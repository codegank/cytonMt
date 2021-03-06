/*
Copyright 2018 XIAOLIN WANG (xiaolin.wang@nict.go.jp; arthur.xlw@gmail.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#include "StackCell.h"

namespace cytonLib
{

bool StackCell::accept(Precision globalScore)
{
	bool res=false;
	if(size()<beamSize)
	{
		res=true;
	}
	else
	{
		res=globalScore>back()->globalScore;
	}
	return res;

}

void StackCell::put(StackState* state)
{
	vector<StackState*>::iterator it=this->begin();
	for(; it!=this->end(); it++)
	{
		if(state->globalScore>(*it)->globalScore)
		{
			break;
		}
	}
	this->insert(it, state);

	int tSize=this->size();
	if(tSize>beamSize)
	{
		this->pop_back();
	}
}

} /* namespace cytonLib */
