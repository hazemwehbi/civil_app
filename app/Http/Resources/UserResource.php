<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'signature' => $this->getFirstMedia('signature')?$this->getFirstMedia('signature')->original_url:'',
            'logo' => $this->getFirstMedia('logo')?$this->getFirstMedia('logo')->original_url:'',
            'title'=>$this->title,
            'email' => $this->email,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'active' => $this->active,
            'role' =>$this->getRoleNames(),
            'parent_logo' => $this->parent&&$this->parent->getFirstMedia('logo')?$this->parent->getFirstMedia('logo')->original_url:'',
            'parent_title'=>$this->parent?$this->parent->title:'',
        ];
    }
}
