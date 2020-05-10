if testcase "query realloc"; then
	echo abc >"$STDIN"
	pick -k "bc \\n" -- -q a <<-EOF
	abc
	EOF
fi

if testcase "big input causing realloc"; then
	cat <<-EOF >"$STDIN"
	DEADBEEF
	I2lmZGVmIEhBVkVfQ09ORklHX0gKI2luY2x1ZGUgImNvbmZpZy5oIgojZW5kaWYKCiNpbmNsdWRl
	IDxzeXMvaW9jdGwuaD4KCiNpbmNsdWRlIDxjdHlwZS5oPgojaW5jbHVkZSA8ZXJyLmg+CiNpbmNs
	dWRlIDxsaW1pdHMuaD4KI2luY2x1ZGUgPGxvY2FsZS5oPgojaW5jbHVkZSA8cG9sbC5oPgojaW5j
	bHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNp
	bmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHRlcm1pb3MuaD4KI2luY2x1ZGUgPHVuaXN0ZC5o
	PgojaW5jbHVkZSA8d2NoYXIuaD4KI2luY2x1ZGUgPHdjdHlwZS5oPgoKI2lmZGVmIEhBVkVfTkNV
	UlNFU1dfSAojaW5jbHVkZSA8bmN1cnNlc3cvY3Vyc2VzLmg+CiNpbmNsdWRlIDxuY3Vyc2Vzdy90
	ZXJtLmg+CiNlbHNlCiNpbmNsdWRlIDxjdXJzZXMuaD4KI2luY2x1ZGUgPHRlcm0uaD4KI2VuZGlm
	CgojaW5jbHVkZSAiY29tcGF0LmgiCgojZGVmaW5lIHR0eV9wdXRwKGNhcGFiaWxpdHksIGZhdGFs
	KSBkbyB7CQkJCVwKCWlmICh0cHV0cygoY2FwYWJpbGl0eSksIDEsIHR0eV9wdXRjKSA9PSBFUlIg
	JiYgKGZhdGFsKSkJCVwKCQllcnJ4KDEsICNjYXBhYmlsaXR5ICI6IHVua25vd24gdGVybWluZm8g
	Y2FwYWJpbGl0eSIpOwlcCn0gd2hpbGUgKDApCgplbnVtIGtleSB7CglVTktOT1dOLAoJQUxUX0VO
	VEVSLAoJQkFDS1NQQUNFLAoJREVMLAoJRU5URVIsCglDVFJMX0EsCglDVFJMX0MsCglDVFJMX0Us
	CglDVFJMX0ssCglDVFJMX0wsCglDVFJMX1UsCglDVFJMX1csCglDVFJMX1osCglSSUdIVCwKCUxF
	RlQsCglMSU5FX0RPV04sCglMSU5FX1VQLAoJUEFHRV9ET1dOLAoJUEFHRV9VUCwKCUVORCwKCUhP
	TUUsCglQUklOVEFCTEUKfTsKCnN0cnVjdCBjaG9pY2UgewoJY29uc3QgY2hhcgkqZGVzY3JpcHRp
	b247Cgljb25zdCBjaGFyCSpzdHJpbmc7CglzaXplX3QJCSBsZW5ndGg7Cglzc2l6ZV90CQkgbWF0
	Y2hfc3RhcnQ7CS8qIGluY2x1c2l2ZSBtYXRjaCBzdGFydCBvZmZzZXQgKi8KCXNzaXplX3QJCSBt
	YXRjaF9lbmQ7CS8qIGV4Y2x1c2l2ZSBtYXRjaCBlbmQgb2Zmc2V0ICovCglkb3VibGUJCSBzY29y
	ZTsKfTsKCnN0YXRpYyBpbnQJCQkgY2hvaWNlY21wKGNvbnN0IHZvaWQgKiwgY29uc3Qgdm9pZCAq
	KTsKc3RhdGljIHZvaWQJCQkgZGVsZXRlX2JldHdlZW4oY2hhciAqLCBzaXplX3QsIHNpemVfdCwg
	c2l6ZV90KTsKc3RhdGljIGNoYXIJCQkqZWFnZXJfc3RycGJyayhjb25zdCBjaGFyICosIGNvbnN0
	IGNoYXIgKik7CnN0YXRpYyB2b2lkCQkJIGZpbHRlcl9jaG9pY2VzKHZvaWQpOwpzdGF0aWMgY2hh
	cgkJCSpnZXRfY2hvaWNlcyh2b2lkKTsKc3RhdGljIGVudW0ga2V5CQkJIGdldF9rZXkoY29uc3Qg
	Y2hhciAqKik7CnN0YXRpYyB2b2lkCQkJIGhhbmRsZV9zaWd3aW5jaChpbnQpOwpzdGF0aWMgaW50
	CQkJIGlzdThjb250KHVuc2lnbmVkIGNoYXIpOwpzdGF0aWMgaW50CQkJIGlzdThzdGFydCh1bnNp
	Z25lZCBjaGFyKTsKc3RhdGljIGludAkJCSBpc3dvcmQoY29uc3QgY2hhciAqKTsKc3RhdGljIHNp
	emVfdAkJCSBtaW5fbWF0Y2goY29uc3QgY2hhciAqLCBzaXplX3QsIHNzaXplX3QgKiwKCQkJCSAg
	ICBzc2l6ZV90ICopOwpzdGF0aWMgc2l6ZV90CQkJIHByaW50X2Nob2ljZXMoc2l6ZV90LCBzaXpl
	DEADBEEF
	EOF
	pick -k "deadbeef \\n" -- <<-EOF
	DEADBEEF
	EOF
fi
