#= 
    This code was generated by heta-compiler of v0.5.9
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    k1 = 1.0
    fakeC = 1.0
    C = fakeC
    S1 = 1.0 / C
    reaction1 = C * k1 / S1
    
    # save results

    return (
        [
            S1 * C,
        ],
        
        [
            fakeC,
            k1,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (fakeC,k1,) = p.static
    (S1_,) = u 

    # Heta rules
    C = fakeC
    S1 = S1_ / C
    reaction1 = C * k1 / S1
    
    #p.static .= [fakeC,k1,]
    du .= [
      reaction1,  # dS1_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (fakeC,k1,) = integrator.p.static
        (S1_,) = u

        # Heta rules
        C = fakeC
        S1 = S1_ / C
        reaction1 = C * k1 / S1
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        fakeC_ = fakeC
        k1_ = k1

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events
function event1_trigger_(u, t, integrator)
    cons = integrator.p.constants
    (fakeC,k1,) = integrator.p.static
    (S1_,) = u

    # Heta rules
    C = fakeC
    S1 = S1_ / C
    reaction1 = C * k1 / S1
    

    return S1 > 2.1 ? 1 : -1
end

### continous events

### event assignments
function event1_assignment_(integrator)
    cons = integrator.p.constants
    t = integrator.t
    (fakeC,k1,) = integrator.p.static
    (S1_,) = integrator.u

    # Heta rules
    C = fakeC
    S1 = S1_ / C
    reaction1 = C * k1 / S1
    
    # recalculated values
    (fakeC,) = (10.0,)
    
    # save results

    integrator.u .= [
        S1 * C,
    ]
    
    integrator.p.static .= [fakeC,k1,]
end


### OUTPUT ###

x00948 = Model(
  start_,
  ode_,
  [
      DEvent(event1_trigger_, event1_assignment_),
  ],
  make_saving_,
  constants_
)

models = (
    x00948 = x00948
)
tasks = ()

export models, tasks

end
