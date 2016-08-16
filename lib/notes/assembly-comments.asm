; these are various snippets of assembly code from Spelunky that I have picked apart


; Sacrificing

Spelunky.exe+14C8A - 83 7C 24 10 20        - cmp dword ptr [esp+10],20 { 32 }				; if favor is >= 32
Spelunky.exe+14C8F - 0F8C 80000000         - jl Spelunky.exe+14D15
Spelunky.exe+14C95 - 8B 3D 8C12F600        - ` mov edi,[Spelunky.exe+13128C] { [0730C020] }
Spelunky.exe+14C9B - BD 03000000           - ` mov ebp,00000003 { 3 }
Spelunky.exe+14CA0 - 39 AF 14064400        - ` cmp [edi+00440614],ebp					; [edi+00440614] is kali favor level (1 = gift,
													;				       2 = kapala,
													;				       3 = invigorate)
Spelunky.exe+14CA6 - 57                    - ` push edi
Spelunky.exe+14CA7 - 7C 1F                 - ` jl Spelunky.exe+14CC8					; if kali favor level is > 3, don't get another invigorate
Spelunky.exe+14CA9 - BB B02BF300           - `+ mov ebx,Spelunky.exe+102BB0 { ["IDS_KALI_ECSTATIC"] }
Spelunky.exe+14CAE - E8 BDB90400           - `+ call Spelunky.exe+60670
Spelunky.exe+14CB3 - 8B 4F 4C              - `+ mov ecx,[edi+4C]
Spelunky.exe+14CB6 - 5F                    - `+ pop edi
Spelunky.exe+14CB7 - 5E                    - `+ pop esi
Spelunky.exe+14CB8 - 5D                    - `+ pop ebp
Spelunky.exe+14CB9 - 5B                    - `+ pop ebx
Spelunky.exe+14CBA - 83 C4 08              - `+ add esp,08 { 8 }
Spelunky.exe+14CBD - 89 4C 24 04           - `+ mov [esp+04],ecx
Spelunky.exe+14CC1 - 8B D0                 - `+ mov edx,eax
Spelunky.exe+14CC3 - E9 D8DD0900           - `+ jmp Spelunky.exe+B2AA0
Spelunky.exe+14CC8 - BB D42BF300           - ` mov ebx,Spelunky.exe+102BD4 { ["IDS_KALI_INVIGORATED"] } ; if kali favor < 3, get invigorate
Spelunky.exe+14CCD - E8 9EB90400           - ` call Spelunky.exe+60670
Spelunky.exe+14CD2 - 8B 57 4C              - ` mov edx,[edi+4C]
Spelunky.exe+14CD5 - 52                    - ` push edx
Spelunky.exe+14CD6 - 8B D0                 - ` mov edx,eax
Spelunky.exe+14CD8 - E8 C3DD0900           - ` call Spelunky.exe+B2AA0
Spelunky.exe+14CDD - A1 8C12F600           - ` mov eax,[Spelunky.exe+13128C] { [0730C020] }
Spelunky.exe+14CE2 - 89 A8 14064400        - ` mov [eax+00440614],ebp 					; increase kali favor level
Spelunky.exe+14CE8 - 8B 8C B0 80064400     - ` mov ecx,[eax+esi*4+00440680]
Spelunky.exe+14CEF - 69 F6 A4140000        - ` imul esi,esi,000014A4 { 5284 }
Spelunky.exe+14CF5 - 83 81 40010000 08     - ` add dword ptr [ecx+00000140],08 { 8 }			; increase health by 8
Spelunky.exe+14CFC - 83 84 06 90064400 08  - ` add dword ptr [esi+eax+00440690],08 { 8 }		; increase shadow health by 8
Spelunky.exe+14D04 - 8D B4 06 90064400     - ` lea esi,[esi+eax+00440690]
Spelunky.exe+14D0B - 5F                    - ` pop edi
Spelunky.exe+14D0C - 5E                    - ` pop esi
Spelunky.exe+14D0D - 5D                    - ` pop ebp
Spelunky.exe+14D0E - 5B                    - ` pop ebx
Spelunky.exe+14D0F - 83 C4 08              - ` add esp,08 { 8 }
Spelunky.exe+14D12 - C2 0400               - ` ret 0004 { 4 }
Spelunky.exe+14D15 - 8B 44 24 10           - mov eax,[esp+10]
Spelunky.exe+14D19 - 83 F8 10              - cmp eax,10 { 16 }						; if favor >= 16
Spelunky.exe+14D1C - 7C 7A                 - jl Spelunky.exe+14D98
Spelunky.exe+14D1E - 8B 35 8C12F600        - ` mov esi,[Spelunky.exe+13128C] { [0730C020] }
Spelunky.exe+14D24 - BD 02000000           - ` mov ebp,00000002 { 2 }
Spelunky.exe+14D29 - 39 AE 14064400        - ` cmp [esi+00440614],ebp
Spelunky.exe+14D2F - 56                    - ` push esi
Spelunky.exe+14D30 - 7C 1F                 - ` jl Spelunky.exe+14D51					; if kali favor level >= 2
Spelunky.exe+14D32 - BB 002CF300           - `+ mov ebx,Spelunky.exe+102C00 { ["IDS_KALI_HAPPY"] }
Spelunky.exe+14D37 - E8 34B90400           - `+ call Spelunky.exe+60670
Spelunky.exe+14D3C - 8B 4E 4C              - `+ mov ecx,[esi+4C]
Spelunky.exe+14D3F - 5F                    - `+ pop edi
Spelunky.exe+14D40 - 5E                    - `+ pop esi
Spelunky.exe+14D41 - 5D                    - `+ pop ebp
Spelunky.exe+14D42 - 5B                    - `+ pop ebx
Spelunky.exe+14D43 - 83 C4 08              - `+ add esp,08 { 8 }
Spelunky.exe+14D46 - 89 4C 24 04           - `+ mov [esp+04],ecx
Spelunky.exe+14D4A - 8B D0                 - `+ mov edx,eax
Spelunky.exe+14D4C - E9 4FDD0900           - `+ jmp Spelunky.exe+B2AA0
Spelunky.exe+14D51 - BB 202CF300           - ` mov ebx,Spelunky.exe+102C20 { ["IDS_KALI_BESTOWS"] }	; if kali favor level < 2
Spelunky.exe+14D56 - E8 15B90400           - ` call Spelunky.exe+60670
Spelunky.exe+14D5B - 8B 56 4C              - ` mov edx,[esi+4C]
Spelunky.exe+14D5E - 52                    - ` push edx
Spelunky.exe+14D5F - 8B D0                 - ` mov edx,eax
Spelunky.exe+14D61 - E8 3ADD0900           - ` call Spelunky.exe+B2AA0
Spelunky.exe+14D66 - 8B 0D 8C12F600        - ` mov ecx,[Spelunky.exe+13128C] { [0730C020] }
Spelunky.exe+14D6C - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14D6E - 89 A9 14064400        - ` mov [ecx+00440614],ebp 					; increase kali favor level
Spelunky.exe+14D74 - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14D77 - 68 0E020000           - ` push 0000020E { 526 } 					; 20E = kapala item ID?
Spelunky.exe+14D7C - 83 EC 08              - ` sub esp,08 { 8 }
Spelunky.exe+14D7F - D9 5C 24 04           - ` fstp dword ptr [esp+04]
Spelunky.exe+14D83 - D9 47 30              - ` fld dword ptr [edi+30]
Spelunky.exe+14D86 - D9 1C 24              - ` fstp dword ptr [esp]
Spelunky.exe+14D89 - E8 42900500           - ` call Spelunky.exe+6DDD0 					; spawn the kapala?
Spelunky.exe+14D8E - 5F                    - ` pop edi
Spelunky.exe+14D8F - 5E                    - ` pop esi
Spelunky.exe+14D90 - 5D                    - ` pop ebp
Spelunky.exe+14D91 - 5B                    - ` pop ebx
Spelunky.exe+14D92 - 83 C4 08              - ` add esp,08 { 8 }
Spelunky.exe+14D95 - C2 0400               - ` ret 0004 { 4 }
Spelunky.exe+14D98 - 83 F8 08              - cmp eax,08 { 8 }
Spelunky.exe+14D9B - 0F8C 1D020000         - jl Spelunky.exe+14FBE 					; if kali favor >= 8
Spelunky.exe+14DA1 - 8B 2D 8C12F600        - ` mov ebp,[Spelunky.exe+13128C] { [0730C020] }
Spelunky.exe+14DA7 - 83 BD 14064400 01     - ` cmp dword ptr [ebp+00440614],01 { 1 }			; if kali favor level >= 1
Spelunky.exe+14DAE - 55                    - ` push ebp
Spelunky.exe+14DAF - 7C 1F                 - ` jl Spelunky.exe+14DD0
Spelunky.exe+14DB1 - BB 002CF300           - `+ mov ebx,Spelunky.exe+102C00 { ["IDS_KALI_HAPPY"] }
Spelunky.exe+14DB6 - E8 B5B80400           - `+ call Spelunky.exe+60670
Spelunky.exe+14DBB - 8B 4D 4C              - `+ mov ecx,[ebp+4C]
Spelunky.exe+14DBE - 5F                    - `+ pop edi
Spelunky.exe+14DBF - 5E                    - `+ pop esi
Spelunky.exe+14DC0 - 5D                    - `+ pop ebp
Spelunky.exe+14DC1 - 5B                    - `+ pop ebx
Spelunky.exe+14DC2 - 83 C4 08              - `+ add esp,08 { 8 }
Spelunky.exe+14DC5 - 89 4C 24 04           - `+ mov [esp+04],ecx
Spelunky.exe+14DC9 - 8B D0                 - `+ mov edx,eax
Spelunky.exe+14DCB - E9 D0DC0900           - `+ jmp Spelunky.exe+B2AA0
Spelunky.exe+14DD0 - BB 202CF300           - ` mov ebx,Spelunky.exe+102C20 { ["IDS_KALI_BESTOWS"] }	; if kali favor level < 1
Spelunky.exe+14DD5 - E8 96B80400           - ` call Spelunky.exe+60670
Spelunky.exe+14DDA - 8B 55 4C              - ` mov edx,[ebp+4C]
Spelunky.exe+14DDD - 52                    - ` push edx
Spelunky.exe+14DDE - 8B D0                 - ` mov edx,eax
Spelunky.exe+14DE0 - E8 BBDC0900           - ` call Spelunky.exe+B2AA0
Spelunky.exe+14DE5 - 8B 1D 8C12F600        - ` mov ebx,[Spelunky.exe+13128C] { [0730C020] }
Spelunky.exe+14DEB - 80 BB 28064400 00     - ` cmp byte ptr [ebx+00440628],00 { 0 }
Spelunky.exe+14DF2 - C7 83 14064400 01000000 ` mov [ebx+00440614],00000001 { 1 }
Spelunky.exe+14DFC - 74 0C                 - ` je Spelunky.exe+14E0A
Spelunky.exe+14DFE - 8B 44 24 1C           - `+ mov eax,[esp+1C]
Spelunky.exe+14E02 - 8B 40 2C              - `+ mov eax,[eax+2C]
Spelunky.exe+14E05 - E8 26C2FFFF           - `+ call Spelunky.exe+11030
Spelunky.exe+14E0A - E8 512EFFFF           - ` call Spelunky.exe+7C60 					; place a random value in EAX ?
Spelunky.exe+14E0F - 83 E0 07              - ` and eax,07 { 7 }						; bit mask to get random value between 0-7
Spelunky.exe+14E12 - 40                    - ` inc eax
Spelunky.exe+14E13 - 8B D0                 - ` mov edx,eax 						; EDX contains copy of random number
Spelunky.exe+14E15 - 83 F8 01              - ` cmp eax,01 { 1 } 					; switch on random number
													; case 1
Spelunky.exe+14E18 - 75 34                 - ` jne Spelunky.exe+14E4E
Spelunky.exe+14E1A - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14E1C - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14E22 - 03 CB                 - ` add ecx,ebx
Spelunky.exe+14E24 - 80 B9 0E074400 00     - ` cmp byte ptr [ecx+0044070E],00 { 0 } 			; if [ecx+0044070e] == 0 && [ecx+00440702] == 0
Spelunky.exe+14E2B - 0F85 2D010000         - ` jne Spelunky.exe+14F5E
Spelunky.exe+14E31 - 80 B9 02074400 00     - ` cmp byte ptr [ecx+00440702],00 { 0 }
Spelunky.exe+14E38 - 0F85 20010000         - ` jne Spelunky.exe+14F5E
Spelunky.exe+14E3E - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14E41 - 50                    - ` push eax
Spelunky.exe+14E42 - 68 09020000           - ` push 00000209 { 521 }					; item ID = cape?
Spelunky.exe+14E47 - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14E49 - E9 54010000           - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14E4E - 83 F8 02              - ` cmp eax,02 { 2 } 					; case 2
Spelunky.exe+14E51 - 75 27                 - ` jne Spelunky.exe+14E7A
Spelunky.exe+14E53 - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14E55 - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14E5B - 80 BC 19 03074400 00  - ` cmp byte ptr [ecx+ebx+00440703],00 { 0 }
Spelunky.exe+14E63 - 0F85 F5000000         - ` jne Spelunky.exe+14F5E
Spelunky.exe+14E69 - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14E6C - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14E6E - 68 F8010000           - ` push 000001F8 { 504 }
Spelunky.exe+14E73 - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14E75 - E9 28010000           - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14E7A - 83 F8 03              - ` cmp eax,03 { 3 } 					; case 3
Spelunky.exe+14E7D - 75 27                 - ` jne Spelunky.exe+14EA6
Spelunky.exe+14E7F - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14E81 - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14E87 - 80 BC 19 07074400 00  - ` cmp byte ptr [ecx+ebx+00440707],00 { 0 }
Spelunky.exe+14E8F - 0F85 C9000000         - ` jne Spelunky.exe+14F5E
Spelunky.exe+14E95 - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14E98 - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14E9A - 68 F7010000           - ` push 000001F7 { 503 }
Spelunky.exe+14E9F - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14EA1 - E9 FC000000           - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14EA6 - 83 F8 04              - ` cmp eax,04 { 4 } 					; case 4
Spelunky.exe+14EA9 - 75 27                 - ` jne Spelunky.exe+14ED2
Spelunky.exe+14EAB - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14EAD - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14EB3 - 80 BC 19 04074400 00  - ` cmp byte ptr [ecx+ebx+00440704],00 { 0 }
Spelunky.exe+14EBB - 0F85 9D000000         - ` jne Spelunky.exe+14F5E
Spelunky.exe+14EC1 - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14EC4 - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14EC6 - 68 F9010000           - ` push 000001F9 { 505 }
Spelunky.exe+14ECB - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14ECD - E9 D0000000           - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14ED2 - 83 F8 05              - ` cmp eax,05 { 5 } 					; case 5
Spelunky.exe+14ED5 - 75 23                 - ` jne Spelunky.exe+14EFA
Spelunky.exe+14ED7 - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14ED9 - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14EDF - 80 BC 19 05074400 00  - ` cmp byte ptr [ecx+ebx+00440705],00 { 0 }
Spelunky.exe+14EE7 - 75 75                 - ` jne Spelunky.exe+14F5E
Spelunky.exe+14EE9 - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14EEC - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14EEE - 68 FA010000           - ` push 000001FA { 506 }
Spelunky.exe+14EF3 - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14EF5 - E9 A8000000           - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14EFA - 83 F8 06              - ` cmp eax,06 { 6 } 					; case 6
Spelunky.exe+14EFD - 75 23                 - ` jne Spelunky.exe+14F22
Spelunky.exe+14EFF - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14F01 - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14F07 - 80 BC 19 06074400 00  - ` cmp byte ptr [ecx+ebx+00440706],00 { 0 }
Spelunky.exe+14F0F - 75 4D                 - ` jne Spelunky.exe+14F5E
Spelunky.exe+14F11 - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14F14 - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14F16 - 68 FB010000           - ` push 000001FB { 507 }
Spelunky.exe+14F1B - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14F1D - E9 80000000           - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14F22 - 83 F8 07              - ` cmp eax,07 { 7 } 					; case 7
Spelunky.exe+14F25 - 75 20                 - ` jne Spelunky.exe+14F47
Spelunky.exe+14F27 - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14F29 - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14F2F - 80 BC 19 0D074400 00  - ` cmp byte ptr [ecx+ebx+0044070D],00 { 0 }
Spelunky.exe+14F37 - 75 25                 - ` jne Spelunky.exe+14F5E
Spelunky.exe+14F39 - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14F3C - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14F3E - 68 FC010000           - ` push 000001FC { 508 }
Spelunky.exe+14F43 - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14F45 - EB 5B                 - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14F47 - 83 F8 08              - ` cmp eax,08 { 8 } 					; case 8
Spelunky.exe+14F4A - 75 12                 - ` jne Spelunky.exe+14F5E
Spelunky.exe+14F4C - 8B CE                 - ` mov ecx,esi
Spelunky.exe+14F4E - 69 C9 A4140000        - ` imul ecx,ecx,000014A4 { 5284 }
Spelunky.exe+14F54 - 80 BC 19 00074400 00  - ` cmp byte ptr [ecx+ebx+00440700],00 { 0 }
Spelunky.exe+14F5C - 74 31                 - ` je Spelunky.exe+14F8F
Spelunky.exe+14F5E - 40                    - ` inc eax 							; default case
Spelunky.exe+14F5F - 83 F8 08              - ` cmp eax,08 { 8 }
Spelunky.exe+14F62 - 7E 05                 - ` jle Spelunky.exe+14F69
Spelunky.exe+14F64 - B8 01000000           - ` mov eax,00000001 { 1 }					; if counter is > 8 reset to 1
Spelunky.exe+14F69 - 3B C2                 - ` cmp eax,edx						
Spelunky.exe+14F6B - 0F85 A4FEFFFF         - ` jne Spelunky.exe+14E15 					; try again with random number + 1
Spelunky.exe+14F71 - D9 47 34              - ` fld dword ptr [edi+34]					; if we've tried every possiblity
Spelunky.exe+14F74 - 69 F6 A4140000        - ` imul esi,esi,000014A4 { 5284 }
Spelunky.exe+14F7A - 80 BC 1E 02074400 00  - ` cmp byte ptr [esi+ebx+00440702],00 { 0 }			; check to see if player has a jetpack
Spelunky.exe+14F82 - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14F84 - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14F86 - 75 15                 - ` jne Spelunky.exe+14F9D
Spelunky.exe+14F88 - 68 0A020000           - ` push 0000020A { 522 }					; if the player doesn't have a jetpack, give them a jetpack
Spelunky.exe+14F8D - EB 13                 - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14F8F - D9 47 34              - ` fld dword ptr [edi+34]
Spelunky.exe+14F92 - 6A 01                 - ` push 01 { 1 }
Spelunky.exe+14F94 - 68 FD010000           - ` push 000001FD { 509 }
Spelunky.exe+14F99 - 8B CB                 - ` mov ecx,ebx
Spelunky.exe+14F9B - EB 05                 - ` jmp Spelunky.exe+14FA2
Spelunky.exe+14F9D - 68 F6010000           - ` push 000001F6 { 502 }					; if the player already has a jetpack, give them bombs
Spelunky.exe+14FA2 - 83 EC 08              - ` sub esp,08 { 8 }
Spelunky.exe+14FA5 - D9 5C 24 04           - ` fstp dword ptr [esp+04]
Spelunky.exe+14FA9 - D9 47 30              - ` fld dword ptr [edi+30]
Spelunky.exe+14FAC - D9 1C 24              - ` fstp dword ptr [esp]
Spelunky.exe+14FAF - E8 1C8E0500           - ` call Spelunky.exe+6DDD0
Spelunky.exe+14FB4 - 5F                    - ` pop edi
Spelunky.exe+14FB5 - 5E                    - ` pop esi
Spelunky.exe+14FB6 - 5D                    - ` pop ebp
Spelunky.exe+14FB7 - 5B                    - ` pop ebx
Spelunky.exe+14FB8 - 83 C4 08              - ` add esp,08 { 8 }
Spelunky.exe+14FBB - C2 0400               - ` ret 0004 { 4 }


; Kapala Blood

Spelunky.exe+525FB - 39 B3 40010000        - cmp [ebx+00000140],esi					; hit with blood?
Spelunky.exe+52601 - 7E 3F                 - jle Spelunky.exe+52642
Spelunky.exe+52603 - C6 87 9C000000 01     - ` mov byte ptr [edi+0000009C],01
Spelunky.exe+5260A - 8B 83 80020000        - ` mov eax,[ebx+00000280]					; [ebx+280] is the address of the player, health is at offset 0
Spelunky.exe+52610 - BA 01000000           - ` mov edx,00000001
Spelunky.exe+52615 - 01 90 84000000        - ` add [eax+00000084],edx					; increase kapala blood level by 1
Spelunky.exe+5261B - 8B 83 80020000        - ` mov eax,[ebx+00000280]
Spelunky.exe+52621 - 83 B8 84000000 08     - ` cmp dword ptr [eax+00000084],08   
Spelunky.exe+52628 - 7C 18                 - ` jl Spelunky.exe+52642					; if kapala blood level equals 8, increase health
Spelunky.exe+5262A - 89 B0 84000000        - `+ mov [eax+00000084],esi					; zero out kapala blood level	
Spelunky.exe+52630 - 8B 83 80020000        - `+ mov eax,[ebx+00000280]
Spelunky.exe+52636 - 01 10                 - `+ add [eax],edx						; add 1 to player health
Spelunky.exe+52638 - 01 93 40010000        - `+ add [ebx+00000140],edx
Spelunky.exe+5263E - EB 02                 - `+ jmp Spelunky.exe+52642
Spelunky.exe+52640 - 33 F6                 - xor esi,esi
Spelunky.exe+52642 - 39 4F 0C              - cmp [edi+0C],ecx


; picking up items

Spelunky.exe+51648 - 8B 3D 8C12FA00        - mov edi,[Spelunky.exe+13128C] { [07D56020] }		;
Spelunky.exe+5164E - 8B 47 4C              - mov eax,[edi+4C]						;
Spelunky.exe+51651 - C7 80 C4351200 FFFFFFFF mov [eax+001235C4],FFFFFFFF { -1 }
Spelunky.exe+5165B - 8B 8D 34020000        - mov ecx,[ebp+00000234]					; [ebp] is player actor, +234 is held object pointer
Spelunky.exe+51661 - 33 DB                 - xor ebx,ebx
Spelunky.exe+51663 - 3B CB                 - cmp ecx,ebx
Spelunky.exe+51665 - 74 6C                 - je Spelunky.exe+516D3
Spelunky.exe+51667 - D9E8                  - ` fld1							; if player actor is holding an object
Spelunky.exe+51669 - D8 99 C0010000        - ` fcomp dword ptr [ecx+000001C0]
Spelunky.exe+5166F - DFE0                  - ` fnstsw ax
Spelunky.exe+51671 - F6 C4 41              - ` test ah,41 { 65 }					; compare some mystery attribute of held object to 1.0
Spelunky.exe+51674 - 74 4F                 - ` je Spelunky.exe+516C5					; if not 1.0...
Spelunky.exe+51676 - 8B 41 0C              - `+ mov eax,[ecx+0C]					; move object ID to eax
Spelunky.exe+51679 - 83 F8 6B              - `+ cmp eax,6B { 107 }
Spelunky.exe+5167C - 74 47                 - `+ je Spelunky.exe+516C5
Spelunky.exe+5167E - 83 F8 6D              - `++ cmp eax,6D { 109 }
Spelunky.exe+51681 - 74 42                 - `++ je Spelunky.exe+516C5
Spelunky.exe+51683 - 3D CF000000           - `++ cmp eax,000000CF { 207 }
Spelunky.exe+51688 - 74 3B                 - `++ je Spelunky.exe+516C5
Spelunky.exe+5168A - 8B 51 08              - `+++ mov edx,[ecx+08]					; move ?? attribute of object to edx (enemy/item type?)
Spelunky.exe+5168D - 83 FA 03              - `+++ cmp edx,03 { 3 }
Spelunky.exe+51690 - 74 33                 - `+++ je Spelunky.exe+516C5
Spelunky.exe+51692 - 83 FA 02              - `++++ cmp edx,02 { 2 }
Spelunky.exe+51695 - 74 2E                 - `++++ je Spelunky.exe+516C5
Spelunky.exe+51697 - 38 99 F4010000        - `+++++ cmp [ecx+000001F4],bl				; cmp [ecx+1F4] (some object attribute) to 0 (ebx should always be 0?)
Spelunky.exe+5169D - 75 26                 - `+++++ jne Spelunky.exe+516C5
Spelunky.exe+5169F - 8B 8D 80020000        - `++++++ mov ecx,[ebp+00000280]				; [ebp+280] is pointer to player state
Spelunky.exe+516A5 - 89 81 88000000        - `++++++ mov [ecx+00000088],eax				; put object ID into player held item
Spelunky.exe+516AB - 8B 95 34020000        - `++++++ mov edx,[ebp+00000234]				; put held object pointer into edx
Spelunky.exe+516B1 - 8B 85 80020000        - `++++++ mov eax,[ebp+00000280]				; put pointer to player state into eax
Spelunky.exe+516B7 - 8B 8A 54010000        - `++++++ mov ecx,[edx+00000154]				; held object attribute at +154 into ecx
Spelunky.exe+516BD - 89 88 8C000000        - `++++++ mov [eax+0000008C],ecx				; transfer that attribute to player state +8C
Spelunky.exe+516C3 - EB 1A                 - `++++++ jmp Spelunky.exe+516DF
Spelunky.exe+516C5 - 8B 95 80020000        - `+ mov edx,[ebp+00000280]					; if object ID is 6B, 6D, CF, or object type(?) is 3 or 2, or object mystery attribute is not 0
Spelunky.exe+516CB - 89 9A 88000000        - ` mov [edx+00000088],ebx					; zero out players held item
Spelunky.exe+516D1 - EB 0C                 - ` jmp Spelunky.exe+516DF			
Spelunky.exe+516D3 - 8B 85 80020000        - mov eax,[ebp+00000280]
Spelunky.exe+516D9 - 89 98 88000000        - mov [eax+00000088],ebx
Spelunky.exe+516DF - 8B 8D 88020000        - mov ecx,[ebp+00000288]					; [ebp] is player actor, + 288 is ??
Spelunky.exe+516E5 - 3B CB                 - cmp ecx,ebx
Spelunky.exe+516E7 - 0F84 8D000000         - je Spelunky.exe+5177A
Spelunky.exe+516ED - 33 D2                 - xor edx,edx
Spelunky.exe+516EF - 33 C0                 - xor eax,eax
Spelunky.exe+516F1 - 39 99 8C020000        - cmp [ecx+0000028C],ebx
Spelunky.exe+516F7 - 74 13                 - je Spelunky.exe+5170C
Spelunky.exe+516F9 - 83 F8 08              - cmp eax,08 { 8 }
Spelunky.exe+516FC - 7D 0E                 - jnl Spelunky.exe+5170C
Spelunky.exe+516FE - 8B 89 88020000        - mov ecx,[ecx+00000288]
Spelunky.exe+51704 - 42                    - inc edx
Spelunky.exe+51705 - 40                    - inc eax
Spelunky.exe+51706 - 3B CB                 - cmp ecx,ebx
Spelunky.exe+51708 - 75 E7                 - jne Spelunky.exe+516F1
Spelunky.exe+5170A - EB 6E                 - jmp Spelunky.exe+5177A
Spelunky.exe+5170C - 83 FA 08              - cmp edx,08 { 8 }
Spelunky.exe+5170F - 7D 69                 - jnl Spelunky.exe+5177A
Spelunky.exe+51711 - 8B B5 34020000        - mov esi,[ebp+00000234]
Spelunky.exe+51717 - 3B F3                 - cmp esi,ebx
Spelunky.exe+51719 - 74 55                 - je Spelunky.exe+51770


; spawn the ghost

Spelunky.exe+647C0 - D9 05 A457F900        - fld dword ptr [Spelunky.exe+1257A4] { [23.00] }
Spelunky.exe+647C6 - 53                    - push ebx
Spelunky.exe+647C7 - 56                    - push esi
Spelunky.exe+647C8 - 8B F0                 - mov esi,eax
Spelunky.exe+647CA - 8B 86 A8000000        - mov eax,[esi+000000A8]
Spelunky.exe+647D0 - 8B 8C 86 80064400     - mov ecx,[esi+eax*4+00440680]
Spelunky.exe+647D7 - CC                    - int 3							; compare player position to mid point
Spelunky.exe+647D8 - 59                    - pop ecx
Spelunky.exe+647D9 - 30 57 6A              - xor [edi+6A],dl
Spelunky.exe+647DC - 01 CC                 - add esp,ecx
Spelunky.exe+647DE - F9                    - stc 
Spelunky.exe+647DF - 03 00                 - add eax,[eax]
Spelunky.exe+647E1 - 00 83 EC08DFE0        - add [ebx-1F20F714],al
Spelunky.exe+647E7 - D9 41 34              - fld dword ptr [ecx+34]
Spelunky.exe+647EA - D9 5C 24 04           - fstp dword ptr [esp+04]
Spelunky.exe+647EE - 8B CE                 - mov ecx,esi
Spelunky.exe+647F0 - F6 C4 41              - test ah,41 { 65 }						; compare player's x location?
Spelunky.exe+647F3 - 75 08                 - jne Spelunky.exe+647FD
Spelunky.exe+647F5 - D9 05 8055F900        - fld dword ptr [Spelunky.exe+125580] { [-5.00] }		; set ghost spawn to the left of the stage
Spelunky.exe+647FB - EB 06                 - jmp Spelunky.exe+64803
Spelunky.exe+647FD - D9 05 7C52F900        - fld dword ptr [Spelunky.exe+12527C] { [51.00] }		; set ghost spawn to the right of the stage
Spelunky.exe+64803 - D9 1C 24              - fstp dword ptr [esp]
Spelunky.exe+64806 - E8 C5950000           - call Spelunky.exe+6DDD0					; ??? create ghost object?
Spelunky.exe+6480B - 8B 86 D4054400        - mov eax,[esi+004405D4]					; [esi+004405D4] is current level (1-20)
Spelunky.exe+64811 - 83 F8 11              - cmp eax,11 { 17 }
Spelunky.exe+64814 - 7C 05                 - jl Spelunky.exe+6481B					
Spelunky.exe+64816 - 83 F8 14              - cmp eax,14 { 20 }
Spelunky.exe+64819 - 7E 23                 - jle Spelunky.exe+6483E					
Spelunky.exe+6481B - 80 BE F7054400 00     - cmp byte ptr [esi+004405F7],00 { 0 }			; if player hasn't reached hell, compare to several flags
Spelunky.exe+64822 - 75 1A                 - jne Spelunky.exe+6483E					;    I'm not sure what these are for, maybe worm/boss levels?
Spelunky.exe+64824 - 80 BE F5054400 00     - cmp byte ptr [esi+004405F5],00 { 0 }
Spelunky.exe+6482B - 75 11                 - jne Spelunky.exe+6483E
Spelunky.exe+6482D - 80 BE 0A064400 00     - cmp byte ptr [esi+0044060A],00 { 0 }
Spelunky.exe+64834 - 75 08                 - jne Spelunky.exe+6483E
Spelunky.exe+64836 - 6A 00                 - push 00 { 0 }
Spelunky.exe+64838 - 56                    - push esi
Spelunky.exe+64839 - E8 32D60100           - call Spelunky.exe+81E70					; called if no flags are set and player isn't in hell, perhaps it's the ghost mist?
Spelunky.exe+6483E - 8B 3D 8C12FA00        - mov edi,[Spelunky.exe+13128C] { [07D56020] }
Spelunky.exe+64844 - 8B 4F 44              - mov ecx,[edi+44]
Spelunky.exe+64847 - C6 41 18 01           - mov byte ptr [ecx+18],01 { 1 }				; set some flag to 1 - perhaps to signal time limit?
Spelunky.exe+6484B - C6 86 EB054400 01     - mov byte ptr [esi+004405EB],01 { 1 }
Spelunky.exe+64852 - 8B 47 58              - mov eax,[edi+58]
Spelunky.exe+64855 - 8B 76 4C              - mov esi,[esi+4C]
Spelunky.exe+64858 - 83 F8 17              - cmp eax,17 { 23 }
Spelunky.exe+6485B - 74 35                 - je Spelunky.exe+64892
Spelunky.exe+6485D - 83 F8 1E              - cmp eax,1E { 30 }
Spelunky.exe+64860 - 74 30                 - je Spelunky.exe+64892
Spelunky.exe+64862 - 6A 01                 - push 01 { 1 }
Spelunky.exe+64864 - 6A 03                 - push 03 { 3 }
Spelunky.exe+64866 - 68 F9030000           - push 000003F9 { 1017 }
Spelunky.exe+6486B - 8B DE                 - mov ebx,esi
Spelunky.exe+6486D - E8 4EDF0200           - call Spelunky.exe+927C0					; ??
Spelunky.exe+64872 - 84 C0                 - test al,al
Spelunky.exe+64874 - 74 1C                 - je Spelunky.exe+64892
Spelunky.exe+64876 - 6A 00                 - push 00 { 0 }
Spelunky.exe+64878 - 57                    - push edi
Spelunky.exe+64879 - BB A0A5F700           - mov ebx,Spelunky.exe+10A5A0 { ["IDS_JOURNAL_ENTRY_ADDED"] }
Spelunky.exe+6487E - E8 EDBDFFFF           - call Spelunky.exe+60670
Spelunky.exe+64883 - 8B D0                 - mov edx,eax
Spelunky.exe+64885 - E8 66E10400           - call Spelunky.exe+B29F0
Spelunky.exe+6488A - 5F                    - pop edi
Spelunky.exe+6488B - 5E                    - pop esi
Spelunky.exe+6488C - 5B                    - pop ebx
Spelunky.exe+6488D - E9 AE540000           - jmp Spelunky.exe+69D40
Spelunky.exe+64892 - 5F                    - pop edi
Spelunky.exe+64893 - 5E                    - pop esi
Spelunky.exe+64894 - 5B                    - pop ebx
Spelunky.exe+64895 - C3                    - ret
