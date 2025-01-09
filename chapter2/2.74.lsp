Exercise 2.74: Insatiable Enterprises, Inc., is a highly de-
centralized conglomerate company consisting of a large num-
ber of independent divisions located all over the world. e
company’s computer facilities have just been interconnected
by means of a clever network-interfacing scheme that makes
the entire network appear to any user to be a single com-
puter. Insatiable’s president, in her first aempt to exploit
the ability of the network to extract administrative infor-
mation from division files, is dismayed to discover that, al-
though all the division files have been implemented as data
structures in Scheme, the particular data structure used varies
from division to division. A meeting of division managers
is hastily called to search for a strategy to integrate the files
that will satisfy headquarters’ needs while preserving the
existing autonomy of the divisions. 

Show how such a strategy can be implemented with data-
directed programming. As an example, suppose that each
division’s personnel records consist of a single file, which
contains a set of records keyed on employees’ names. The
structure of the set varies from division to division. Fur-
thermore, each employee’s record is itself a set (structured
diﬀerently from division to division) that contains informa-
tion keyed under identifiers such as address and salary.
In particular:

a. Implement for headquarters a get-record procedure
that retrieves a specified employee’s record from a
specified personnel file. The procedure should be ap-
plicable to any division’s file. Explain how the individ-
ual divisions’ files should be structured. In particular,
what type information must be supplied?

Doesn't matter how the divisions files are structured. Caller must provide a tagged file and an employee name

(define (get-record file employee-name)
    (let ((tag (type-tag file)))
        (apply-specific 'get-record tag file employee-name)
    )
)

b. Implement for headquarters a get-salary procedure
that returns the salary information from a given em-
ployee’s record from any division’s personnel file. How
should the record be structured in order to make this
operation work?

(define (get-salary file employee-name)
       (let ((tag (type-tag file)))
        (apply-specific 'get-salary tag file employee-name)
    )     
)


