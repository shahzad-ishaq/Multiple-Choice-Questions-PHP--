<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuestionOption extends Model
{
    protected $table = 'questionoption';
    protected $primaryKey = "id";
    protected $fillable = [
        'question_id',
        'option_text'
    ];
}
