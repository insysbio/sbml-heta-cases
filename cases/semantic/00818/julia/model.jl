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
    kf = 0.9
    C = 1.0
    S1 = 1.0 / C
    kr = 0.075
    S2 = 0.0 / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    
    # save results

    return (
        [
            S2 * C,
        ],
        
        [
            C,
            S1,
            kf,
            kr,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,S1,kf,kr,) = p.static
    (S2_,) = u 

    # Heta rules
    S2 = S2_ / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    
    #p.static .= [C,S1,kf,kr,]
    du .= [
      reaction1,  # dS2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,S1,kf,kr,) = integrator.p.static
        (S2_,) = u

        # Heta rules
        S2 = S2_ / C
        reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
        
        # calculate amounts
        C_ = C
        S1_ = S1 * C
        reaction1_ = reaction1
        kf_ = kf
        kr_ = kr

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events

### continous events

### event assignments


### OUTPUT ###

x00818 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00818 = x00818
)
tasks = ()

export models, tasks

end
