<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Result extends Model
{
    protected $table = 'result';
    protected $primaryKey = "id";
    protected $fillable = [
        'user_id',
        'question_id',
        'option_id',
         'tage'
    ];
    public function questionBody(): BelongsTo
    {
        return $this->belongsTo(Questions::class,'question_id');
    }
    public function questionOption()
    {
        return $this->hasMany(QuestionOption::class,'question_id', 'question_id');
    }
}
