<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Questions extends Model
{
    protected $table = 'questions';
    protected $primaryKey = "id";
    protected $fillable = [
        'question_text',
    ];

    public function questionOption()
    {
        return $this->hasOne(QuestionOption::class,'question_id');
    }
}
