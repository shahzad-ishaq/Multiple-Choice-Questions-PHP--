<?php

namespace App\Http\Resources;

use App\Models\Result;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class QuestionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            
            "question_no"=> Result::where('user_id',$this->user_id)->whereIn('tage',[1,2])->count(),            
            "question_id"=> $this->questionBody->id,            
            "question_text"=> $this->questionBody->question_text,            
            'questionOption'=>$this->questionOption
        ];
    }
}
